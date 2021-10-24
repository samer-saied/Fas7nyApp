import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class DioServices {
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
      Response response = await dio.get(gategory);
      return response.data;
    } catch (error) {
      return [];
    }
  }

  Future<dynamic> getOnePlace(
      {required String gategory, required String placeID}) async {
    try {
      Response response = await dio.get('$gategory/$placeID');
      print("ID :" + placeID);
      return response.data;
    } catch (error) {
      print("---------------------");
      return [];
    }
  }
}
