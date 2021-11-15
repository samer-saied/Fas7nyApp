import 'package:bloc/bloc.dart';
import 'package:fas7ny/cubit/city_cubit/city_state.dart';
import 'package:fas7ny/data/repository/home_repository.dart';
import 'package:fas7ny/models/place_model.dart';

class PlacesCityCubit extends Cubit<CityState> {
  HomesRepository homeRepository;
  PlacesCityCubit(this.homeRepository) : super(CityInitialState());

  List<Place> placesCity = [];

  void getPlacesForCity({required String cityName}) {
    emit(PlacesCityLoadingState());
    homeRepository.getCityPlaces(cityName: cityName).then((places) {
      placesCity = places;

      emit(PlacesCityLoadedState(placesCity));
    }).catchError((error) {
      emit(PlacesCityErrorState(error.toString()));
    });
  }
}
