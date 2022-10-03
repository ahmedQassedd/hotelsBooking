class LoginModel {
  Status? status;
  Data? data;


  LoginModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }


}

class Status {
  String? type;
  Title? title;


  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'] != null ?  Title.fromJson(json['title']) : null;
  }


}

class Title {
  String? ar;
  String? en;


  Title.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

}

class Data {
  int? id;
  String? name;
  String? email;
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
