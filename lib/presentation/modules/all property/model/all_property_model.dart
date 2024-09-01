class FincaPropertyModel {
  int? id;
  int? propertyTypeId;
  String? propertyTypeName;
  String? mainPropertyTypeName;
  int? cityId;
  String? cityName;
  int? areaId;
  String? areaName;
  List<Eminities>? eminities;
  int? hits;
  String? address;
  String? constructionStatus;
  String? propertyName;
  String? size;
  String? price;
  String? priceType;
  String? otherCost;
  String? totalPrice;
  String? sizeKatha;
  String? bedroom;
  String? bathroom;
  String? belconies;
  String?garages;
  String? floor;
  String? totalFloor;
  String? facing;
  String? furnished;
  String? handoverDate;
  String? title;
  String? slug;
  String? description;
  String? featuredImage;
  String? uploadVideo;
  String? mapLocation;
  String? status;
  int? user;
  int? propertyType;
  int? city;
  int? area;

  FincaPropertyModel(
      {this.id,
        this.propertyTypeId,
        this.propertyTypeName,
        this.mainPropertyTypeName,
        this.cityId,
        this.cityName,
        this.areaId,
        this.areaName,
        this.eminities,
        this.hits,
        this.address,
        this.constructionStatus,
        this.propertyName,
        this.size,
        this.price,
        this.priceType,
        this.otherCost,
        this.totalPrice,
        this.sizeKatha,
        this.bedroom,
        this.bathroom,
        this.belconies,
        this.garages,
        this.floor,
        this.totalFloor,
        this.facing,
        this.furnished,
        this.handoverDate,
        this.title,
        this.slug,
        this.description,
        this.featuredImage,
        this.uploadVideo,
        this.mapLocation,
        this.status,
        this.user,
        this.propertyType,
        this.city,
        this.area});

  FincaPropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyTypeId = json['property_type_id'];
    propertyTypeName = json['property_type_name'];
    mainPropertyTypeName = json['main_property_type_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    if (json['eminities'] != null) {
      eminities = <Eminities>[];
      json['eminities'].forEach((v) {
        eminities!.add(new Eminities.fromJson(v));
      });
    }
    hits = json['hits'];
    address = json['address'];
    constructionStatus = json['construction_status'];
    propertyName = json['property_name'];
    size = json['size'];
    price = json['price'];
    priceType = json['price_type'];
    otherCost = json['other_cost'];
    totalPrice = json['total_price'];
    sizeKatha = json['size_katha'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    belconies = json['belconies'];
    garages = json['garages'];
    floor = json['floor'];
    totalFloor = json['total_floor'];
    facing = json['facing'];
    furnished = json['furnished'];
    handoverDate = json['handover_date'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    featuredImage = json['featured_image'];
    uploadVideo = json['upload_video'];
    mapLocation = json['map_location'];
    status = json['status'];
    user = json['user'];
    propertyType = json['property_type'];
    city = json['city'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_type_id'] = this.propertyTypeId;
    data['property_type_name'] = this.propertyTypeName;
    data['main_property_type_name'] = this.mainPropertyTypeName;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    if (this.eminities != null) {
      data['eminities'] = this.eminities!.map((v) => v.toJson()).toList();
    }
    data['hits'] = this.hits;
    data['address'] = this.address;
    data['construction_status'] = this.constructionStatus;
    data['property_name'] = this.propertyName;
    data['size'] = this.size;
    data['price'] = this.price;
    data['price_type'] = this.priceType;
    data['other_cost'] = this.otherCost;
    data['total_price'] = this.totalPrice;
    data['size_katha'] = this.sizeKatha;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['belconies'] = this.belconies;
    data['garages'] = this.garages;
    data['floor'] = this.floor;
    data['total_floor'] = this.totalFloor;
    data['facing'] = this.facing;
    data['furnished'] = this.furnished;
    data['handover_date'] = this.handoverDate;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['featured_image'] = this.featuredImage;
    data['upload_video'] = this.uploadVideo;
    data['map_location'] = this.mapLocation;
    data['status'] = this.status;
    data['user'] = this.user;
    data['property_type'] = this.propertyType;
    data['city'] = this.city;
    data['area'] = this.area;
    return data;
  }
}

class Eminities {
  int? id;
  String? name;

  Eminities({this.id, this.name});

  Eminities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}