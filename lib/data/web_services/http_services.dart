import 'dart:convert';
import 'dart:io';

import 'package:fas7ny/constants/strings.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  Map<String, String> headersget = {
    HttpHeaders.authorizationHeader: token,
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Map<String, String> headersPost = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<String> getData({required String gategory}) async {
    final response = await http.get(
      Uri.parse(baseUrl + gategory),
      headers: headersget,
    );
    print("---- Get ---- :" +
        "${Uri.parse(baseUrl + gategory)}" +
        " ---- Response Code ----" +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get Object');
    }
  }

  Future<String> postData(
      {required String gategory,
      required Map<String, dynamic> bodyData}) async {
    final response = await http.post(Uri.parse(baseUrl + gategory),
        headers: headersget, body: bodyData);
    print("---- Post ---- :" +
        "${Uri.parse(baseUrl + gategory)}" +
        " ---- Response Code ----" +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get Object');
    }
  }

  Future<String> updateData(
      {required String gategoryUrl, required bodyData}) async {
    final response = await http.put(Uri.parse(baseUrl + gategoryUrl),
        headers: headersget, body: jsonEncode(bodyData));
    print("---- Put ---- :" +
        "${Uri.parse(baseUrl + gategoryUrl)}" +
        " ---- Response Code ----" +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to put Object');
    }
  }

/////////////////       AUTH USER      ////////////////////////////
  Future<String> loginUser(
      {required String userName, required String password}) async {
    final response = await http.post(
      Uri.parse(baseUrl + 'auth/local'),
      headers: headersPost,
      body: jsonEncode({"identifier": userName, "password": password}),
    );
    print("---- Post ---- :" +
        "${Uri.parse(baseUrl + 'auth/local')}" +
        " ---- Response Code ----" +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else if (response.statusCode != 200) {
      {
        Map<String, dynamic> error =
            jsonDecode(response.body) as Map<String, dynamic>;
        throw (error["data"][0]["messages"][0]["message"]);
      }
    } else {
      throw ("Something gonna wrong on Login");
    }
  }
}
