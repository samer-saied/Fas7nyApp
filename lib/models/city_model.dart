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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['Name_ar'] = this.nameAr;
    data['Name_en'] = this.nameEn;
    data['id'] = this.id;
    return data;
  }
}
