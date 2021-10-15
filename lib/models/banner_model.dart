import 'package:fas7ny/models/place_model.dart';

import 'images_model.dart';

class Banner {
  late String title;
  late String description;
  late String publishedAt;
  late String createdAt;
  late String updatedAt;
  late Images bannerImage;
  late Place place;
  late String id;

  Banner.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bannerImage = (json['bannerImage'] != null
        ? Images.fromJson(json['bannerImage'])
        : null)!;

    place = (json['place'] != null ? Place.fromJson(json['place']) : tempPlace);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.bannerImage != null) {
      data['bannerImage'] = this.bannerImage.toJson();
    }
    if (this.place != null) {
      data['place'] = this.place.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}
