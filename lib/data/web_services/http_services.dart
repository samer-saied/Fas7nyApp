import 'dart:convert';
import 'dart:io';

import 'package:fas7ny/constants/strings.dart';
import 'package:fas7ny/data/local/log.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpServices {
  ///
  ///
  ///
  /////////////////////       Get         ////////////////////////////
  Future<String> getData({required String gategory}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('user') ?? 'empty';
      Map<String, String> headersGet = {};
      headersGet.addAll(headers);
      headersGet.putIfAbsent(
          HttpHeaders.authorizationHeader, () => "Bearer " + token);
      print(headersGet);
      final response = await http.get(
        Uri.parse(baseUrl + gategory),
        headers: headersGet,
      );
      Log.printHttpLog(
          gategory: gategory,
          requestType: 'get',
          statusCode: response.statusCode.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'empty';
      }
    } catch (error) {
      rethrow;
    }
  }

  ///
  ///
  ///
  /////////////////////        POST         ////////////////////////////
  Future<String> postData({required String gategory, required bodyData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user');
    Map<String, String> headersPost = {};
    headersPost.addAll(headers);
    headersPost.putIfAbsent(
        HttpHeaders.authorizationHeader, () => "Bearer " + token!);

    final response = await http.post(Uri.parse(baseUrl + gategory),
        headers: headersPost, body: bodyData);
    Log.printHttpLog(
        gategory: gategory,
        requestType: 'Post',
        statusCode: response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      throw Exception(response.body);
    } else {
      throw Exception('Something gone Error');
    }
  }

  ///
  ///
  ///
  ///////////////////       UPDATE        ////////////////////////////
  Future<String> updateData(
      {required String gategory, required bodyData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user');
    Map<String, String> headersPut = {};
    headersPut.addAll(headers);
    headersPut.putIfAbsent(
        HttpHeaders.authorizationHeader, () => "Bearer " + token!);
    final response = await http.put(Uri.parse(baseUrl + gategory),
        headers: headersPut, body: jsonEncode(bodyData));
    Log.printHttpLog(
        gategory: gategory,
        requestType: 'Put',
        statusCode: response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to put Object');
    }
  }

  ///
  ///
  ///
  ///
  /////////////////       AUTH USER      ////////////////////////////
  Future<String> loginUser(
      {required String userName, required String password}) async {
    final response = await http.post(
      Uri.parse(baseUrl + 'auth/local'),
      headers: headers,
      body: jsonEncode({"identifier": userName, "password": password}),
    );
    Log.printHttpLog(
        gategory: 'auth/local',
        requestType: 'Post',
        statusCode: response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode != 200) {
      {
        Map<String, dynamic> error =
            jsonDecode(response.body) as Map<String, dynamic>;
        throw (error["data"][0]["messages"][0]["message"]);
      }
    } else {
      throw ("Something gone wrong on Login");
    }
  }

  ///
  ///
  ///
  /////////////////////        Register New User         ////////////////////////////
  Future<String> registerUser(
      {required String gategory, required bodyData}) async {
    Map<String, String> headersPost = {};
    headersPost.addAll(headers);

    final response = await http.post(Uri.parse(baseUrl + gategory),
        headers: headersPost, body: bodyData);
    Log.printHttpLog(
        gategory: gategory,
        requestType: 'Post',
        statusCode: response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      throw Exception(response.body);
    } else {
      throw Exception('Something gone Error');
    }
  }
}
