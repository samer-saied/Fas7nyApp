import 'images_model.dart';

class Banner {
  late String title;
  late String description;
  late String publishedAt;
  late String createdAt;
  late String updatedAt;
  late Images bannerImage;
  late String placeID;
  late String id;

  Banner.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bannerImage = Images.fromJson(json['bannerImage']);
    placeID = json['place']['id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (bannerImage != null) {
      data['bannerImage'] = bannerImage.toJson();
    }
    if (placeID != null) {
      data['place']['id'] = placeID;
    }
    data['id'] = id;
    return data;
  }
}
