import 'dart:convert';

import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/place_model.dart';


class PlacesRepository {
  final HttpServices services;

  PlacesRepository(this.services);

  Future<List<Place>> getAllPlaces() async {
    try {
      final response = await services.getData(gategory: 'places');
      List<dynamic> cities = jsonDecode(response);
      return cities.map((place) => Place.fromJson(place)).toList();
    } catch (e) {
      throw Exception('Failed to load places');
    }
  }

  // Future<Place> getOnePlace(String placeId) async {
  //   final place =
  //       await services.getOnePlace(gategory: 'places', placeID: placeId);
  //   return place;
  // }
}
