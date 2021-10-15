import 'images_model.dart';

class Place {
  late int expectedPrice;
  late List<Images> images;
  late List<String> seasons;
  late String address;
  late String fullName;
  late String description;
  late String publishedAt;
  late String updatedAt;
  late Images mainImage;
  late List<String> moods = [];
  late List<String> activities = [];
  late List<String> perfectTimes = [];
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
      json['seasons'].forEach((v) {
        seasons.add(v);
      });
    }
    expectedPrice = json['expected_price'];
    address = json['address'];
    fullName = json['full_name'];
    description = json['description'];
    publishedAt = json['published_at'];
    updatedAt = json['updatedAt'];
    mainImage = (json['main_image'] != null
        ? Images.fromJson(json['main_image'])
        : null)!;

    if (json['activities'] != null) {
      activities = <String>[];
      json['activities'].forEach((v) {
        activities.add(Activities.fromJson(v).activityName);
      });
    }
    if (json['perfect_times'] != null) {
      perfectTimes = <String>[];
      json['perfect_times'].forEach((v) {
        perfectTimes.add(PerfectTimes.fromJson(v).period);
      });
    }

    id = json['id'];
    if (json['moods'] != null) {
      moods = [];
      json['moods'].forEach((mood) {
        //  print(mood.toString());
        moods.add(mood['mood_name']);
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['expected_price'] = expectedPrice;
    if (images != null) {
      data['images'] = images.map((v) => v).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons.map((v) => v).toList();
    }
    data['address'] = address;
    data['full_name'] = fullName;
    data['description'] = description;
    data['published_at'] = publishedAt;
    data['updatedAt'] = updatedAt;
    if (mainImage != null) {
      data['main_image'] = mainImage.toJson();
    }
    if (moods != null) {
      data['moods'] = moods.map((v) => v).toList();
    }
    if (activities != null) {
      data['activities'] = activities.map((v) => v).toList();
    }
    if (perfectTimes != null) {
      data['perfect_times'] = perfectTimes.map((v) => v).toList();
    }
    data['id'] = id;
    return data;
  }
}

Place tempPlace = Place.fromJson(temp);

Map<String, dynamic> temp = {
  "expected_price": 0,
  "images": [
    {
      "url":
          "https://res.cloudinary.com/fas7ny/image/upload/v1634024958/download_a025d6ccf0.png",
      "id": "616502fad1fb735647721e51"
    }
  ],
  "seasons": [],
  "_id": "61650316d1fb735647721e54",
  "rate": 4,
  "latitude": "0",
  "longitude": "0",
  "address": "No Plce Available",
  "full_name": "None",
  "description": " None",
  "locale": "ar-EG",
  "published_at": "2021-10-12T03:42:15.750Z",
  "createdAt": "2021-10-12T03:37:58.957Z",
  "updatedAt": "2021-10-12T03:42:16.601Z",
  "__v": 0,
  "main_image": {
    "id": "616502fad1fb735647721e51",
    "url":
        "https://res.cloudinary.com/fas7ny/image/upload/v1634024958/download_a025d6ccf0.png",
  },
  "city": "none",
  "id": "61650316d1fb735647721e54"
};

class Seasons {
  late String name;
  late String id;

  Seasons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Activities {
  late String activityName;
  late String activityDescription;
  late String id;

  Activities.fromJson(Map<String, dynamic> json) {
    activityName = json['activity_name'];
    activityDescription = json['activity_description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_name'] = activityName;
    data['activity_description'] = activityDescription;
    data['id'] = id;
    return data;
  }
}

class PerfectTimes {
  late String time;
  late String period;
  late String id;

  PerfectTimes.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    period = json['period'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['period'] = period;
    data['id'] = id;
    return data;
  }
}
