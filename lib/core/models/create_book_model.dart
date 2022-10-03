class CreateBookModel {
  Status? status;


  CreateBookModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
  }

}

class Status {
  String? type;
  Title? title;
  int? bookingId;


  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'] != null ?  Title.fromJson(json['title']) : null;
    bookingId = json['booking_id'];
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
