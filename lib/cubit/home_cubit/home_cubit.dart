import 'package:bloc/bloc.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/data/repository/home_repositoryy.dart';
import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomesRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  List<Banner> allBanners = [];
  List<City> allCities = [];

  void getAllBanners() {
    emit(BannerLoadingState());
    homeRepository.getAllBanners().then((banners) {
      allBanners = banners;

      emit(BannerLoadedState(allBanners));
    });
  }

  void getAllCities() {
    emit(CityLoadingState());
    homeRepository.getAllCities().then((cities) {
      print(cities);
      allCities = cities;
      emit(CityLoadedState(allCities));
    });
  }
}
