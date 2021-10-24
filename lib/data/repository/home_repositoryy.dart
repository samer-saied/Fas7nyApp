import 'dart:convert';

import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';
import 'package:fas7ny/models/place_model.dart';

class HomesRepository {
  final HttpServices services;

  HomesRepository(this.services);

  Future<List<Banner>> getAllBanners() async {
    try {
      final response = await services.getData(gategory: "banners");
      List<dynamic> bannersData = jsonDecode(response);
      return bannersData.map((banner) => Banner.fromJson(banner)).toList();
    } catch (error) {
      throw Exception('Failed to load Object');
    }
  }

  Future<List<City>> getAllCities() async {
    final response = await services.getData(gategory: "cities");
    List<dynamic> citiesData = jsonDecode(response);
    return citiesData.map((cityData) => City.fromJson(cityData)).toList();
  }

  Future<List<Place>> getCityPlaces({required String cityName}) async {
    final response = await services.getData(
        gategory: "places/?_where[city.Name_en]=" + cityName);
    List<dynamic> placesData = jsonDecode(response);
    return placesData.map((place) => Place.fromJson(place)).toList();
  }

  Future<Place> getPlace({required String placeId}) async {
    final response = await services.getData(gategory: "Places/" + placeId);
    dynamic placeData = jsonDecode(response);
    return Place.fromJson(placeData);
  }

  Future<List<Place>> getAllRecommendedPlaces() async {
    final response = await services.getData(gategory: 'places');
    List<dynamic> places = jsonDecode(response);
    return places.map((place) => Place.fromJson(place)).toList();
  }
}
