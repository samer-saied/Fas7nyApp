import 'package:fas7ny/models/place_model.dart';

import '../web_services/dio_services.dart';

class PlacesRepository {
  final Services services;

  PlacesRepository(this.services);

  Future<List<Place>> getAllPlaces() async {
    try {
      final List places =
          await services.getAllWithLang(gategory: 'places', lang: 'en');
      print(places.length);
      return places.map((place) => Place.fromJson(place)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Place> getOnePlace(String placeId) async {
    final place = await services.getOnePlace(
        gategory: 'placess', lang: 'en', placeID: '');
    return place;
  }
}
