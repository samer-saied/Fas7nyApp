import 'dart:convert';

import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/place_model.dart';

class SearchRepository {
  final HttpServices services;

  SearchRepository(this.services);

  Future<List<Place>> getSearchResults(String searchData) async {
    String searchTxt =
        "places?_where[_or][0][name_en_contains]=$searchData&_where[_or][1][description_en_contains]=$searchData";
    final response = await services.getData(gategory: searchTxt);
    List<dynamic> places = jsonDecode(response);
    return places.map((place) => Place.fromJson(place)).toList();
  }
}
