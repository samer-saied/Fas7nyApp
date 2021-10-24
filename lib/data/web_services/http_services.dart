import 'dart:io';

import 'package:fas7ny/constants/strings.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader: token,
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<String> getData({required String gategory}) async {
    final response = await http.get(
      Uri.parse(baseUrl + gategory),
      headers: headers,
    );
    print("---- Get ---- :" +
        "${Uri.parse(baseUrl + gategory)}" +
        " ---- Response Code ----" +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load Object');
    }
  }
}
