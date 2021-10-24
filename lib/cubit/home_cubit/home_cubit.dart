import 'package:bloc/bloc.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/data/repository/home_repositoryy.dart';
import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';
import 'package:fas7ny/models/place_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomesRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  List<Banner> allBanners = [];
  List<City> allCities = [];
  List<Moods> allMoods = [];
  List<Place> recommendedPlaces = [];
  late Place place;

  void getAllBanners() {
    emit(BannerLoadingState());
    homeRepository.getAllBanners().then((banners) {
      allBanners = banners;

      emit(BannerLoadedState(allBanners));
    }).catchError((error) {
      emit(BannerErrorState(error.toString()));
    });
  }

  void getAllCities() {
    emit(CityLoadingState());
    homeRepository.getAllCities().then((cities) {
      allCities = cities;
      emit(CityLoadedState(allCities));
    }).catchError((error) {
      emit(CityErrorState(error.toString()));
    });
  }

  void getPlace({required String placeId}) {
    emit(PlaceLoadingState());
    homeRepository.getPlace(placeId: placeId).then((city) {
      emit(PlaceLoadedState(city));
    }).catchError((error) {
      emit(PlaceErrorState(error.toString()));
    });
    ;
  }

  void getAllRecommendedPlaces() {
    emit(PlacesLoadingState());
    homeRepository.getAllRecommendedPlaces().then((places) {
      recommendedPlaces = places;
      emit(PlacesLoadedState(places));
    }).catchError((error) {
      emit(PlacesErrorState(error.toString()));
    });
  }
}
