import 'package:fas7ny/models/banner_model.dart';
import 'package:fas7ny/models/city_model.dart';

import '../web_services/dio_services.dart';

class HomesRepository {
  final Services services;

  HomesRepository(this.services);

  Future<List<Banner>> getAllBanners() async {
    final banners = await services.getAll(gategory: "banners");
    return banners
        .map(
            (bannerData) => Banner.fromJson(bannerData as Map<String, dynamic>))
        .toList();
  }

  Future<List<City>> getAllCities() async {
    final cities =
        await services.getAllWithLang(gategory: "cities", lang: 'en');
    return cities
        .map((cityData) => City.fromJson(cityData as Map<String, dynamic>))
        .toList();
  }

  void getOneHome(String placeId) async {
    // final place = await services.
  }
}
