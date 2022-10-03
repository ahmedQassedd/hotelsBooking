class GetBookModel {
  Status? status;
  Data? data;


  GetBookModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Status {
  String? type;


  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }


}

class Data {
  int? currentPage;
  List<DetailsData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  String? perPage;
  dynamic to;
  dynamic total;



  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DetailsData>[];
      json['data'].forEach((v) {
        data!.add( DetailsData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add( Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}

class DetailsData {
  int? id;
  String? userId;
  dynamic hotelId;
  dynamic type;
  String? createdAt;
  String? updatedAt;
  User? user;
  Hotel? hotel;



  DetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    hotel = json['hotel'] != null ?  Hotel.fromJson(json['hotel']) : null;
  }


}

class User {
  int? id;
  dynamic name;
  dynamic email;
  String? apiToken;
  dynamic image;
  String? createdAt;
  String? updatedAt;




  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }
}

class Hotel {
  int? id;
  dynamic name;
  dynamic description;
  dynamic price;
  dynamic address;
  String? longitude;
  String? latitude;
  dynamic rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;



  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['hotel_images'] != null) {
      hotelImages = <HotelImages>[];
      json['hotel_images'].forEach((v) {
        hotelImages!.add( HotelImages.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add( Facilities.fromJson(v));
      });
    }
  }

}

class HotelImages {
  int? id;
  dynamic hotelId;
  dynamic image;




  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];

  }


}

class Facilities {
  int? id;
  dynamic name;
  dynamic image;
  String? createdAt;
  String? updatedAt;


  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Links {
  String? url;
  String? label;
  bool? active;


  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }


}
