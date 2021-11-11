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

//         Recommended              //
class RecomandedLoadingState extends HomeState {}

class RecomandedErrorState extends HomeState {
  final String error;

  RecomandedErrorState(this.error);
}

class RecomandedLoadedState extends HomeState {
  final List<Place> recommendedPlaces;

  RecomandedLoadedState(this.recommendedPlaces);
}

// //        Moods              //
// class MoodsLoadingState extends HomeState {}

// class MoodsErrorState extends HomeState {
//   final String error;

//   MoodsErrorState(this.error);
// }

// class MoodsLoadedState extends HomeState {
//   final List<Moods> moods;

//   MoodsLoadedState(this.moods);
// }
