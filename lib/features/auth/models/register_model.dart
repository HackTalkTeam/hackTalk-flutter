// class RegisterModel {
//   int? status;
//   String? message;
//   Data? data;
//
//   RegisterModel({this.status, this.message, this.data});
//
//   RegisterModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   UserDate? userDate;
//   String? accessToken;
//
//   Data({this.userDate, this.accessToken});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     userDate = json['user_date'] != null
//         ? new UserDate.fromJson(json['user_date'])
//         : null;
//     accessToken = json['access_token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.userDate != null) {
//       data['user_date'] = this.userDate!.toJson();
//     }
//     data['access_token'] = this.accessToken;
//     return data;
//   }
// }
//
// class UserDate {
//   String? name;
//   String? email;
//   String? updatedAt;
//   String? createdAt;
//   int? id;
//
//   UserDate({this.name, this.email, this.updatedAt, this.createdAt, this.id});
//
//   UserDate.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['updated_at'] = this.updatedAt;
//     data['created_at'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }
