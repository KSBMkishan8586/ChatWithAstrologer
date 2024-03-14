class LoginModel {
  String? status;
  String? message;
  String? otp;
  String? otpresponse;
  String? phone;
  String? newUser;

  LoginModel(
      {this.status,
        this.message,
        this.otp,
        this.otpresponse,
        this.phone,
        this.newUser});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    message = json['message'];
    otp = json['otp'].toString();
    otpresponse = json['otpresponse'];
    phone = json['phone'];
    newUser = json['new_user'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['otp'] = otp;
    data['otpresponse'] = otpresponse;
    data['phone'] = phone;
    data['new_user'] = newUser;
    return data;
  }
}
