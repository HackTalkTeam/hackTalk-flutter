class CVResultModel {
  dynamic? time;
  String? bodyLanguageClass;

  CVResultModel({this.time, this.bodyLanguageClass});

  CVResultModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    bodyLanguageClass = json['body_language_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['body_language_class'] = this.bodyLanguageClass;
    return data;
  }
}
