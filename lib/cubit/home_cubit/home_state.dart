import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';

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
