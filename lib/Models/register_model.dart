class RegisterModel {
  String? status;
  String? message;
  Data? data;

  RegisterModel({this.status, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? role;
  String? socialId;
  String? loginType;
  String? fbId;
  String? ipAddress;
  String? username;
  String? password;
  String? salt;
  String? email;
  String? phone;
  String? activationCode;
  String? forgottenPasswordCode;
  String? forgottenPasswordTime;
  String? rememberCode;
  String? createdOn;
  String? lastLogin;
  String? active;
  String? firstName;
  String? lastName;
  String? userProfileImage;
  String? permission;
  String? company;
  String? gender;
  String? deviceId;
  String? deviceToken;
  String? lat;
  String? lon;
  String? token;
  String? otp;
  String? status;
  String? verification;
  String? wallet;
  String? dateOfBirth;
  String? timeOfBirth;
  String? placeOfBirth;
  String? referralCode;
  String? customerCrDate;
  String? firstOfferRecharge;
  String? referredBy;
  String? usedPromoCode;
  String? prmocodedateTime;
  String? usedReferCode;
  String? skip;

  Data(
      {this.id,
        this.role,
        this.socialId,
        this.loginType,
        this.fbId,
        this.ipAddress,
        this.username,
        this.password,
        this.salt,
        this.email,
        this.phone,
        this.activationCode,
        this.forgottenPasswordCode,
        this.forgottenPasswordTime,
        this.rememberCode,
        this.createdOn,
        this.lastLogin,
        this.active,
        this.firstName,
        this.lastName,
        this.userProfileImage,
        this.permission,
        this.company,
        this.gender,
        this.deviceId,
        this.deviceToken,
        this.lat,
        this.lon,
        this.token,
        this.otp,
        this.status,
        this.verification,
        this.wallet,
        this.dateOfBirth,
        this.timeOfBirth,
        this.placeOfBirth,
        this.referralCode,
        this.customerCrDate,
        this.firstOfferRecharge,
        this.referredBy,
        this.usedPromoCode,
        this.prmocodedateTime,
        this.usedReferCode,
        this.skip});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    socialId = json['social_id'];
    loginType = json['login_type'];
    fbId = json['fb_id'];
    ipAddress = json['ip_address'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    email = json['email'];
    phone = json['phone'];
    activationCode = json['activation_code'];
    forgottenPasswordCode = json['forgotten_password_code'];
    forgottenPasswordTime = json['forgotten_password_time'];
    rememberCode = json['remember_code'];
    createdOn = json['created_on'];
    lastLogin = json['last_login'];
    active = json['active'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userProfileImage = json['user_profile_image'];
    permission = json['permission'];
    company = json['company'];
    gender = json['gender'];
    deviceId = json['device_id'];
    deviceToken = json['device_token'];
    lat = json['lat'];
    lon = json['lon'];
    token = json['token'];
    otp = json['otp'];
    status = json['status'];
    verification = json['verification'];
    wallet = json['wallet'];
    dateOfBirth = json['date_of_birth'];
    timeOfBirth = json['time_of_birth'];
    placeOfBirth = json['place_of_birth'];
    referralCode = json['referral_code'];
    customerCrDate = json['customer_cr_date'];
    firstOfferRecharge = json['first_offer_recharge'];
    referredBy = json['referred_by'];
    usedPromoCode = json['used_promo_code'];
    prmocodedateTime = json['prmocodedate_time'];
    usedReferCode = json['used_refer_code'];
    skip = json['skip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['social_id'] = socialId;
    data['login_type'] = loginType;
    data['fb_id'] = fbId;
    data['ip_address'] = ipAddress;
    data['username'] = username;
    data['password'] = password;
    data['salt'] = salt;
    data['email'] = email;
    data['phone'] = phone;
    data['activation_code'] = activationCode;
    data['forgotten_password_code'] = forgottenPasswordCode;
    data['forgotten_password_time'] = forgottenPasswordTime;
    data['remember_code'] = rememberCode;
    data['created_on'] = createdOn;
    data['last_login'] = lastLogin;
    data['active'] = active;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_profile_image'] = userProfileImage;
    data['permission'] = permission;
    data['company'] = company;
    data['gender'] = gender;
    data['device_id'] = deviceId;
    data['device_token'] = deviceToken;
    data['lat'] = lat;
    data['lon'] = lon;
    data['token'] = token;
    data['otp'] = otp;
    data['status'] = status;
    data['verification'] = verification;
    data['wallet'] = wallet;
    data['date_of_birth'] = dateOfBirth;
    data['time_of_birth'] = timeOfBirth;
    data['place_of_birth'] = placeOfBirth;
    data['referral_code'] = referralCode;
    data['customer_cr_date'] = customerCrDate;
    data['first_offer_recharge'] = firstOfferRecharge;
    data['referred_by'] = referredBy;
    data['used_promo_code'] = usedPromoCode;
    data['prmocodedate_time'] = prmocodedateTime;
    data['used_refer_code'] = usedReferCode;
    data['skip'] = skip;
    return data;
  }
}
