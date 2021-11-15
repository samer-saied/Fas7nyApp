import 'dart:convert';

import 'package:fas7ny/constants/strings.dart';
import 'package:http/http.dart' as http;

const imgTempIconUrl = "https://openweathermap.org/img/w/";

class WeatherServices {
  Future<Map<String, dynamic>> getCurrentWeather(String countryName) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$countryName&appid=$weatherApiKey&units=metric";
    var link = Uri.parse(url);
    final response = await http.get(link);
    String responseString = response.body;
    if (response.statusCode == 200) {
      var json = jsonDecode(responseString);
      return {
        "temp": json["main"]["temp"],
        "icon": json["weather"][0]["icon"],
      };
    } else {
      return {"temp": "0", "img": ""};
    }
  }
}
