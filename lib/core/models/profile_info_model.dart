class ProfileInfoModel {
  Status? status;
  Data? data;


  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  dynamic name;
  dynamic email;
  String? apiToken;
  dynamic image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    image = json['image'];
  }

}
