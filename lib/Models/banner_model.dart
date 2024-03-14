class BannerModel {
  int? success;
  bool? result;
  String? message;
  List<Data>? data;

  BannerModel({this.success, this.result, this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? id;
  String? image;
  String? link;
  String? banner;
  String? redirectTo;
  String? doctorId;
  String? subCatImg;

  Data({
    this.id,
    this.image,
    this.link,
    this.banner,
    this.redirectTo,
    this.doctorId,
    this.subCatImg,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    image = json['image'].toString();
    link = json['link'].toString();
    banner = json['banner'].toString();
    redirectTo = json['redirect_to'].toString();
    doctorId = json['doctor_id'].toString();
    subCatImg = json['sub_cat_img'].toString();
  }
}
