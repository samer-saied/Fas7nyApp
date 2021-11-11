import 'package:fas7ny/models/images_model.dart';

class User {
  String jwt = "";
  late UserData user;

  User({required jwt, required user});

  User.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = UserData.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = jwt;
    data['user'] = user.toJson();

    return data;
  }
}

class UserData {
  late bool confirmed;
  late bool blocked;
  late String accountType;
  late String sId;
  late String email;
  late String username;
  late String provider;
  late String createdAt;
  late String updatedAt;
  late String role;
  late String mobile;
  late Images image;
  late String id;

  UserData(
      {required confirmed,
      required blocked,
      required accountType,
      required sId,
      required email,
      required username,
      required provider,
      required createdAt,
      required updatedAt,
      required role,
      required mobile,
      required image,
      required id});

  UserData.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    accountType = json['accountType'];
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    provider = json['provider'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role']['type'];
    mobile = json['mobile'];
    image = Images.fromJson(json['image']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['accountType'] = accountType;
    data['_id'] = sId;
    data['email'] = email;
    data['username'] = username;
    data['provider'] = provider;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['role'] = role;

    data['mobile'] = mobile;
    data['image'] = image.toJson();
    data['id'] = id;
    return data;
  }
}
