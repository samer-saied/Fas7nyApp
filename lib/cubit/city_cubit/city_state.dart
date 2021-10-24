import 'package:fas7ny/models/place_model.dart';

abstract class CityState {}

class CityInitialState extends CityState {}

class PlacesCityLoadingState extends CityState {}

class PlacesCityErrorState extends CityState {
  final String error;

  PlacesCityErrorState(this.error);
}

class PlacesCityLoadedState extends CityState {
  final List<Place> placesCity;

  PlacesCityLoadedState(this.placesCity);
}
