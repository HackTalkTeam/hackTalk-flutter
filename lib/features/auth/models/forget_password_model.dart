class ForgetPasswordModel {
  int? status;
  String? message;
  dynamic? data;

  ForgetPasswordModel({this.status, this.message, this.data});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
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
