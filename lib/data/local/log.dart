import 'package:fas7ny/constants/strings.dart';

class Log {
  static printHttpLog(
      {required String gategory,
      required String requestType,
      required String statusCode}) {
    print("---- Get ---- :" +
        "${Uri.parse(baseUrl + gategory)}" +
        " ---- Response Code ----" +
        statusCode);
  }
}
