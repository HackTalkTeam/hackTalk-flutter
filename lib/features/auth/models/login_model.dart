// class LoginModel {
//   int? status;
//   String? message;
//   Data? data;
//
//   LoginModel({this.status, this.message, this.data});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
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
//   int? id;
//   String? name;
//   String? email;
//   Null? emailVerifiedAt;
//   String? createdAt;
//   String? updatedAt;
//
//   UserDate(
//       {this.id,
//         this.name,
//         this.email,
//         this.emailVerifiedAt,
//         this.createdAt,
//         this.updatedAt});
//
//   UserDate.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
