import 'package:fas7ny/models/images_model.dart';

class City {
  late String sId;
  late String name;
  late String locale;
  late String createdAt;
  late String updatedAt;
  late int iV;
  late String id;
  late Images image;

  City.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    locale = json['locale'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
    image =
        (json['image'] != null ? new Images.fromJson(json['image']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['locale'] = this.locale;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }

    return data;
  }
}
