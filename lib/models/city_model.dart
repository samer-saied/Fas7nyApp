import 'package:fas7ny/models/images_model.dart';

class City {
  late Images image;
  late String nameAr;
  late String nameEn;
  late String id;

  City.fromJson(Map<String, dynamic> json) {
    image = Images.fromJson(json['image']);
    nameAr = json['Name_ar'];
    nameEn = json['Name_en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image.toJson();
    }
    data['Name_ar'] = nameAr;
    data['Name_en'] = nameEn;
    data['id'] = id;
    return data;
  }
}
