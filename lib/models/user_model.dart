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
    final Map<String, dynamic> data = <String, dynamic>{};
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
  late String fristname;
  late String lastname;
  late String provider;
  late String createdAt;
  late String updatedAt;
  late String role;
  late String mobile;
  Images? image;
  late String id;

  UserData({
    required this.email,
    required this.username,
    required this.fristname,
    required this.lastname,
    required this.mobile,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    accountType = json['accountType'] ?? 'Free';
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    fristname = json['fristName'] ?? "";
    lastname = json['lastName'] ?? "";
    provider = json['provider'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role']['type'];
    mobile = json['mobile'] ?? "";
    id = json['id'];
    if (json['image'] != null) {
      image = Images.fromJson(json['image']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['fristName'] = fristname;
    data['lastName'] = lastname;
    data['mobile'] = mobile;
    // data['image'] = image.toJson();
    return data;
  }
}
