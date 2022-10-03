class GetHotelsModel {

  Status? status;
  late Data data;


  GetHotelsModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    data =  Data.fromJson(json['data']) ;
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
  List<HotelDetails>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  String? perPage;
  late int to;
  late int total;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <HotelDetails>[];
      json['data'].forEach((v) {
        data!.add( HotelDetails.fromJson(v));
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

class HotelDetails {
  late int id;
  late String name;
  String? description;
  String? price;
  late String address;
  String? longitude;
  String? latitude;
  late String rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<HotelFacilities>? hotelFacilities;



  HotelDetails.fromJson(Map<String, dynamic> json) {
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
    if (json['hotel_facilities'] != null) {
      hotelFacilities = <HotelFacilities>[];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add( HotelFacilities.fromJson(v));
      });
    }
  }

}

class HotelImages {
  int? id;
  String? hotelId;
  late String image;




  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];

  }


}

class HotelFacilities {
  int? id;
  String? hotelId;
  String? facilityId;



  HotelFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];

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
