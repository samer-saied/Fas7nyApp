import 'dart:convert';

import 'package:fas7ny/models/images_model.dart';

import 'city_model.dart';

class Place {
  late int expectedPrice;
  late List<Images> images;
  late List<String> seasons;
  late int rate;
  late String latitude;
  late String longitude;
  late String address;
  late String publishedAt;
  late String createdAt;
  late String updatedAt;
  late Images mainImage;
  late String city;
  late String descriptionAr;
  late String nameAr;
  late String addressAr;
  late String addressEn;
  late String descriptionEn;
  late String nameEn;
  late List<Moods> moods = [];
  late List<Activities> activities;
  late List<PerfectTimes> perfectTimes;
  late String id;

  Place.fromJson(Map<String, dynamic> json) {
    expectedPrice = json['expected_price'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = [];

      json['seasons'].forEach((season) {
        seasons.add(season);
        print(seasons.toList());
      });
    }
    rate = json['rate'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mainImage = Images.fromJson(json['main_image']);
    city = json['city'];
    descriptionAr = json['description_ar'];
    nameAr = json['name_ar'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    descriptionEn = json['description_en'];
    nameEn = json['name_en'];
    if (json['moods'] != null) {
      moods = <Moods>[];
      json['moods'].forEach((v) {
        moods.add(Moods.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities.add(Activities.fromJson(v));
      });
    }
    if (json['perfect_times'] != null) {
      perfectTimes = <PerfectTimes>[];
      json['perfect_times'].forEach((v) {
        perfectTimes.add(PerfectTimes.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['expected_price'] = this.expectedPrice;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons.map((v) => v).toList();
    }
    data['rate'] = this.rate;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['published_at'] = this.publishedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.mainImage != null) {
      data['main_image'] = this.mainImage.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city;
    }
    data['description_ar'] = this.descriptionAr;
    data['name_ar'] = this.nameAr;
    data['address_ar'] = this.addressAr;
    data['address_en'] = this.addressEn;
    data['description_en'] = this.descriptionEn;
    data['name_en'] = this.nameEn;
    if (this.moods != null) {
      data['moods'] = this.moods.map((v) => v.toJson()).toList();
    }
    if (this.activities != null) {
      data['activities'] = this.activities.map((v) => v.toJson()).toList();
    }
    if (this.perfectTimes != null) {
      data['perfect_times'] = this.perfectTimes.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Seasons {
  late String nameAr;
  late String nameEn;
  late String id;

  Seasons.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['id'] = this.id;
    return data;
  }
}

class Moods {
  late String moodDescriptionEn;
  late String moodNameEn;
  late String moodDescriptionAr;
  late String moodNameAr;
  late String id;

  Moods.fromJson(Map<String, dynamic> json) {
    moodDescriptionEn = json['mood_description_en'];
    moodNameEn = json['mood_name_en'];
    moodDescriptionAr = json['mood_description_ar'];
    moodNameAr = json['mood_name_ar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mood_description_en'] = this.moodDescriptionEn;
    data['mood_name_en'] = this.moodNameEn;
    data['mood_description_ar'] = this.moodDescriptionAr;
    data['mood_name_ar'] = this.moodNameAr;
    data['id'] = this.id;
    return data;
  }
}

class Activities {
  late String activityDescriptionEn;
  late String activityNameEn;
  late String activityDescriptionAr;
  late String activityNameAr;
  late String id;

  Activities.fromJson(Map<String, dynamic> json) {
    activityDescriptionEn = json['activity_description_en'];
    activityNameEn = json['activity_name_en'];
    activityDescriptionAr = json['activity_description_ar'];
    activityNameAr = json['activity_name_ar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['activity_description_en'] = this.activityDescriptionEn;
    data['activity_name_en'] = this.activityNameEn;
    data['activity_description_ar'] = this.activityDescriptionAr;
    data['activity_name_ar'] = this.activityNameAr;
    data['id'] = this.id;
    return data;
  }
}

class PerfectTimes {
  late String period;
  late String timeAr;
  late String timeEn;
  late String id;

  PerfectTimes.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    timeAr = json['time_ar'];
    timeEn = json['time_en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['period'] = this.period;
    data['time_ar'] = this.timeAr;
    data['time_en'] = this.timeEn;
    data['id'] = this.id;
    return data;
  }
}
