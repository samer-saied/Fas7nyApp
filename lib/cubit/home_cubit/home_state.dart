import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';
import 'package:fas7ny/models/place_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

//        Banner              //
class BannerLoadingState extends HomeState {}

class BannerErrorState extends HomeState {
  final String error;

  BannerErrorState(this.error);
}

class BannerLoadedState extends HomeState {
  final List<Banner> banners;

  BannerLoadedState(this.banners);
}

//            Place          //
class PlaceLoadingState extends HomeState {}

class PlaceErrorState extends HomeState {
  final String error;

  PlaceErrorState(this.error);
}

class PlaceLoadedState extends HomeState {
  final Place place;

  PlaceLoadedState(this.place);
} //            Place          //

class PlacesLoadingState extends HomeState {}

class PlacesErrorState extends HomeState {
  final String error;

  PlacesErrorState(this.error);
}

class PlacesLoadedState extends HomeState {
  final List<Place> places;

  PlacesLoadedState(this.places);
}

//        City              //
class CityLoadingState extends HomeState {}

class CityErrorState extends HomeState {
  final String error;

  CityErrorState(this.error);
}

class CityLoadedState extends HomeState {
  final List<City> cities;

  CityLoadedState(this.cities);
}

//        Moods              //
class MoodsLoadingState extends HomeState {}

class MoodsErrorState extends HomeState {
  final String error;

  MoodsErrorState(this.error);
}

class MoodsLoadedState extends HomeState {
  final List<Moods> moods;

  MoodsLoadedState(this.moods);
}
