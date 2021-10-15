import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class Services {
  late Dio dio;

  Services() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 60 seconds,
      receiveTimeout: 60 * 1000,
      headers: {
        "authorization": token,
      },
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAll({required String gategory}) async {
    try {
      Response response = await dio.get('$gategory');
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<dynamic>> getAllWithLang(
      {required String gategory, required String lang}) async {
    try {
      Response response = await dio.get('$gategory?_locale=$lang');
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getOnePlace(
      {required String gategory,
      required String lang,
      required String placeID}) async {
    try {
      Response response = await dio.get('$gategory/$placeID?_locale=$lang');
      // print(response.data.toString());
      return response.data;
    } catch (error) {
      //  print(error.toString());
      return [];
    }
  }
}
