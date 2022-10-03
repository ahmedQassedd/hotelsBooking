class SearchModel {
  Status? status;
  Data? data;


  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ?  Status.fromJson(json['status']) : null;
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
  List<DetailOfData>? data;
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
      data = <DetailOfData>[];
      json['data'].forEach((v) {
        data!.add( DetailOfData.fromJson(v));
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

class DetailOfData {
  int? id;
  dynamic name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  dynamic rate;
  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;



  DetailOfData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
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
  String? hotelId;
  String? image;




  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];

  }

}

class Facilities {
  int? id;
  String? name;
  String? image;
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
