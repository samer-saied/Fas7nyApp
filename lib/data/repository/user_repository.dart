import 'dart:convert';

import 'package:fas7ny/data/local/shared.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/user_model.dart';

class UserRepository {
  final HttpServices services;

  UserRepository(this.services);

  Future<User> loginUser(
      {required String userName, required String password}) async {
    final response =
        await services.loginUser(password: password, userName: userName);
    dynamic userJson = jsonDecode(response);
    var user = User.fromJson(userJson);
    SharedSetting().setSetting("userID", user.user.id);

    return user;
  }

  Future<User> registerUser({
    required Map<String, dynamic> userdata,
    required String passworddata,
  }) async {
    userdata['password'] = passworddata;

    final response = await services.registerUser(
        gategory: "auth/local/register", bodyData: jsonEncode(userdata));
    dynamic bodyData = jsonDecode(response);
    var user = User.fromJson(bodyData);
    SharedSetting().setSetting("userID", user.user.id);

    return user;
  }

  Future<UserData?> checkTokenUser() async {
    String response = await services.getData(gategory: "users/me");
    if (response != 'empty') {
      UserData userId = UserData.fromJson(jsonDecode(response));
      String userdata = await services.getData(gategory: "users/" + userId.id);
      SharedSetting().setSetting("userID", userId.id);

      UserData user = UserData.fromJson(jsonDecode(userdata));
      return user;
    } else {
      throw Exception('No User Saved');
    }
  }
}
