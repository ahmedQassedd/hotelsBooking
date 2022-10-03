
class ChangePassModel {
  Status? status;
  Data? data;


  ChangePassModel.fromJson(Map<String, dynamic> json) {
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
  String? en;
  String? ar;


  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

}

class Data {
  int? id;
  String? name;
  String? email;
  String? apiToken;




  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];

  }

}
