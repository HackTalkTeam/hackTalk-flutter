class LogOutModel {
  int? status;
  String? message;
  dynamic? data;

  LogOutModel({this.status, this.message, this.data});

  LogOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
