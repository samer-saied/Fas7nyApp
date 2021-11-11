import 'dart:convert';

import 'package:fas7ny/constants/strings.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/models/user_model.dart';

class UserRepository {
  final HttpServices services;

  UserRepository(this.services);

  Future<User> loginUser({required String data}) async {
    final response = await services.loginUser(data: data);
    dynamic user = jsonDecode(response);
    return User.fromJson(user);
  }

  Future<List<Place>> getFavorites() async {
    String getFav = "favourites?users_permissions_user=$userID";
    final response = await services.getData(gategory: getFav);
    var places = jsonDecode(response);
    // Frist Item Of user places to avoid duplicate user fav list
    List<dynamic> favPlaces = places[0]['places'];
    return favPlaces.map((place) {
      return Place.fromJson(place as Map<String, dynamic>);
    }).toList();
  }

  Future<List<Place>> deleteFavorites(bodyData) async {
    final response = await services.updateData(
        gategoryUrl: 'favourites/' + favUserID, bodyData: bodyData);
    var places = jsonDecode(response);

    List<dynamic> favPlaces = places['places'];
    return favPlaces
        .map((place) => Place.fromJson(place as Map<String, dynamic>))
        .toList();
  }

  Future<List<Place>> updateFavorites(bodyData) async {
    final response = await services.updateData(
        gategoryUrl: 'favourites/' + favUserID, bodyData: bodyData);
    var places = jsonDecode(response);

    List<dynamic> favPlaces = places['places'];
    return favPlaces
        .map((place) => Place.fromJson(place as Map<String, dynamic>))
        .toList();
  }
}
