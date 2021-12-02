import 'dart:convert';

import 'package:fas7ny/data/local/shared.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavRepository {
  final HttpServices services;
  FavRepository(this.services);
  //late String favID;

  Future<String> getFavID({required String userID}) async {
    var response = await services.getData(
        gategory: "favourites?users_permissions_user=$userID");
    var data = jsonDecode(response);
    // favID = data["id"];
    SharedSetting().setSetting("favID", data[0]["id"]);
    return data[0]["id"];
  }

  Future<String> createFav({required String userID}) async {
    Map<String, dynamic> bodyData = {"users_permissions_user": userID};
    var response = await services.postData(
        gategory: "favourites", bodyData: jsonEncode(bodyData));
    Map<String, dynamic> data = jsonDecode(response);
    // favID = data["id"];
    SharedSetting().setSetting("favID", data["id"]);
    return data["id"];
  }

  Future<List<Place>> getFavorites() async {
    //String getFav = "favourites?users_permissions_user=$userID";
    SharedPreferences pref = await SharedPreferences.getInstance();
    String favID = pref.getString('favID') ?? 'empty';
    if (favID.isEmpty || favID == 'empty') {
      String userID = pref.getString('userID') ?? 'empty';
      getFavID(userID: userID);
    }

    String getFav = "favourites/$favID";
    final response = await services.getData(gategory: getFav);
    var places = jsonDecode(response);
    // Frist Item Of user places to avoid duplicate user fav list
    List<dynamic> favPlaces = places['places'];
    return favPlaces.map((place) {
      return Place.fromJson(place as Map<String, dynamic>);
    }).toList();
  }

  Future<List<Place>> updateFavoritesData(
      {required List<Place> favPlaces}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userID = pref.getString('userID') ?? '';
    String favID = pref.getString('favID') ?? '';
    Map<String, dynamic> data = {
      "places": favPlaces.map((e) => {"_id": e.id}).toList(),
      "users_permissions_user": {"_id": userID}
    };
    final response = await services.updateData(
        gategory: 'favourites/' + favID, bodyData: data);
    var places = jsonDecode(response);

    List<dynamic> favPlacesData = places['places'];
    return favPlacesData
        .map((place) => Place.fromJson(place as Map<String, dynamic>))
        .toList();
  }

  // Future<List<Place>> updateFavorites(bodyData) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String favID = pref.getString('favID') ?? '';
  //   final response = await services.updateData(
  //       gategory: 'favourites/' + favID, bodyData: bodyData);
  //   var places = jsonDecode(response);

  //   List<dynamic> favPlaces = places['places'];
  //   return favPlaces
  //       .map((place) => Place.fromJson(place as Map<String, dynamic>))
  //       .toList();
  // }
}
