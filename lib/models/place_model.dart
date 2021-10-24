import 'package:fas7ny/models/images_model.dart';

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
  late List<Moods> moods;
  late List<Activities> activities;
  late List<PerfectTimes> perfectTimes;
  late String id;

  Place.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = [];

      json['seasons'].forEach((season) {
        seasons.add(Seasons.fromJson(season).nameEn);
      });
    }
    if (json['moods'] != null) {
      moods = <Moods>[];
      json['moods'].forEach((v) {
        //moods.add(Moods(id: v));
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
    expectedPrice = json['expected_price'];
    rate = json['rate'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mainImage = Images.fromJson(json['main_image']);
    city = json['city']['Name_en'];
    descriptionAr = json['description_ar'];
    nameAr = json['name_ar'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    descriptionEn = json['description_en'];
    nameEn = json['name_en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expected_price'] = expectedPrice;
    if (images != null) {
      data['images'] = images.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons.map((v) => v).toList();
    }
    data['rate'] = rate;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (mainImage != null) {
      data['main_image'] = mainImage.toJson();
    }
    if (city != null) {
      data['city'] = city;
    }
    data['description_ar'] = descriptionAr;
    data['name_ar'] = nameAr;
    data['address_ar'] = addressAr;
    data['address_en'] = addressEn;
    data['description_en'] = descriptionEn;
    data['name_en'] = nameEn;
    if (moods != null) {
      data['moods'] = moods.map((v) => v.toJson()).toList();
    }
    if (activities != null) {
      data['activities'] = activities.map((v) => v.toJson()).toList();
    }
    if (perfectTimes != null) {
      data['perfect_times'] = perfectTimes.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
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
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['id'] = id;
    return data;
  }
}

class Moods {
  late String moodDescriptionEn;
  late String moodNameEn;
  late String moodDescriptionAr;
  late String moodNameAr;
  late String id;

  Moods({required id});
  Moods.fromJson(Map<String, dynamic> json) {
    moodDescriptionEn = json['mood_description_en'];
    moodNameEn = json['mood_name_en'];
    moodDescriptionAr = json['mood_description_ar'];
    moodNameAr = json['mood_name_ar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mood_description_en'] = moodDescriptionEn;
    data['mood_name_en'] = moodNameEn;
    data['mood_description_ar'] = moodDescriptionAr;
    data['mood_name_ar'] = moodNameAr;
    data['id'] = id;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_description_en'] = activityDescriptionEn;
    data['activity_name_en'] = activityNameEn;
    data['activity_description_ar'] = activityDescriptionAr;
    data['activity_name_ar'] = activityNameAr;
    data['id'] = id;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['period'] = period;
    data['time_ar'] = timeAr;
    data['time_en'] = timeEn;
    data['id'] = id;
    return data;
  }
}
