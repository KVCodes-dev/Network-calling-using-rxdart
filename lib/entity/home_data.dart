class HomeData {
  bool status;
  String message;
  List<Data> data;
  int totalPages;
  String imagePath;
  String thumbPath;

  HomeData(
      {this.status,
        this.message,
        this.data,
        this.totalPages,
        this.imagePath,
        this.thumbPath});

  HomeData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    imagePath = json['image_path'];
    thumbPath = json['thumb_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['image_path'] = this.imagePath;
    data['thumb_path'] = this.thumbPath;
    return data;
  }
}

class Data {
  String id;
  String serviceId;
  String userId;
  String firstname;
  String image;
  String videos;
  String description;
  String location;
  String price;
  String startDate;
  String endDate;
  String latitute;
  String longitute;
  String age;
  String sport;
  String gender;
  String isCertified;
  String distance;
  String lastname;
  String type;
  String date;
  List<Tags> tags;
  String serviceTypeName;
  String serviceTypeColor;
  String rating;
  String favorite;
  String isAd;

  Data(
      {this.id,
        this.serviceId,
        this.userId,
        this.firstname,
        this.image,
        this.videos,
        this.description,
        this.location,
        this.price,
        this.startDate,
        this.endDate,
        this.latitute,
        this.longitute,
        this.age,
        this.sport,
        this.gender,
        this.isCertified,
        this.distance,
        this.lastname,
        this.type,
        this.date,
        this.tags,
        this.serviceTypeName,
        this.serviceTypeColor,
        this.rating,
        this.favorite,
        this.isAd});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    userId = json['user_id'];
    firstname = json['firstname'];
    image = json['image'];
    videos = json['videos'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    latitute = json['latitute'];
    longitute = json['longitute'];
    age = json['age'];
    sport = json['sport'];
    gender = json['gender'];
    isCertified = json['is_certified'];
    distance = json['distance'];
    lastname = json['lastname'];
    type = json['type'];
    date = json['date'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    serviceTypeName = json['service_type_name'];
    serviceTypeColor = json['service_type_color'];
    rating = json['rating'];
    favorite = json['favorite'];
    isAd = json['isAd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['user_id'] = this.userId;
    data['firstname'] = this.firstname;
    data['image'] = this.image;
    data['videos'] = this.videos;
    data['description'] = this.description;
    data['location'] = this.location;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['latitute'] = this.latitute;
    data['longitute'] = this.longitute;
    data['age'] = this.age;
    data['sport'] = this.sport;
    data['gender'] = this.gender;
    data['is_certified'] = this.isCertified;
    data['distance'] = this.distance;
    data['lastname'] = this.lastname;
    data['type'] = this.type;
    data['date'] = this.date;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['service_type_name'] = this.serviceTypeName;
    data['service_type_color'] = this.serviceTypeColor;
    data['rating'] = this.rating;
    data['favorite'] = this.favorite;
    data['isAd'] = this.isAd;
    return data;
  }
}

class Tags {
  String name;
  String image;

  Tags({this.name, this.image});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}