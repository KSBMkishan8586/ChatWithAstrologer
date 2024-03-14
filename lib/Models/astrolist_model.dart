class AstrolistModel {
  int? status;
  List<Records>? records;
  String? message;
  int? counts;
  int? allCounts;

  AstrolistModel(
      {this.status, this.records, this.message, this.counts, this.allCounts});

  AstrolistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    message = json['message'];
    counts = json['counts'];
    allCounts = json['all_counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['counts'] = this.counts;
    data['all_counts'] = this.allCounts;
    return data;
  }
}

class Records {
  String? astroStatus;
  String? astroSort;
  String? id;
  String? ownerName;
  String? status;
  String? shopName;
  String? email;
  String? password;
  String? address;
  String? phone;
  String? alternateMobile;
  String? currency;
  String? city;
  String? country;
  String? lat;
  String? lon;
  String? imgUrl;
  String? idProof;
  String? bankProof;
  String? state;
  String? activate;
  String? gender;
  String? startingPrice;
  String? avgRating;
  String? exp;
  String? skill;
  String? remedies;
  String? mainexperties;
  String? dob;
  String? language;
  String? pincode;
  String? experience;
  String? workingEx;
  String? ctc;
  String? portalName;
  String? bankAccountNumber;
  String? accountType;
  String? ifscCode;
  String? bankAccountName;
  String? panCardNo;
  String? aadharCardNumber;
  String? callPriceM;
  String? chatPriceM;
  String? chatCommission;
  String? callCommission;
  String? astroDiscount;
  String? commDesc;
  String? shortBio;
  String? longBio;
  String? deviceId;
  String? deviceToken;
  String? token;
  String? currentStatus;
  String? currentStatusCall;
  String? seen;
  String? waitTime;
  String? waitTimeCall;
  String? callRandval;
  String? reportRandval;
  String? commentRandval;
  String? astroDeviceToken;
  String? offerCategory;
  String? consultationPrice;
  String? videoCallCommissionM;
  String? ownerImage;
  String? videoCallPriceM;
  String? currentStatusVideoCall;
  String? freeMinut;
  String? introUrl;
  String? loginStatus;
  String? nextLogin;
  int? liveStatus;
  String? createdDatetime;
  String? image;
  String? offerSpecial;
  String? offerBest;
  String? offerDeal;
  String? offerNew;

  Records(
      {this.astroStatus,
        this.astroSort,
        this.id,
        this.ownerName,
        this.status,
        this.shopName,
        this.email,
        this.password,
        this.address,
        this.phone,
        this.alternateMobile,
        this.currency,
        this.city,
        this.country,
        this.lat,
        this.lon,
        this.imgUrl,
        this.idProof,
        this.bankProof,
        this.state,
        this.activate,
        this.gender,
        this.startingPrice,
        this.avgRating,
        this.exp,
        this.skill,
        this.remedies,
        this.mainexperties,
        this.dob,
        this.language,
        this.pincode,
        this.experience,
        this.workingEx,
        this.ctc,
        this.portalName,
        this.bankAccountNumber,
        this.accountType,
        this.ifscCode,
        this.bankAccountName,
        this.panCardNo,
        this.aadharCardNumber,
        this.callPriceM,
        this.chatPriceM,
        this.chatCommission,
        this.callCommission,
        this.astroDiscount,
        this.commDesc,
        this.shortBio,
        this.longBio,
        this.deviceId,
        this.deviceToken,
        this.token,
        this.currentStatus,
        this.currentStatusCall,
        this.seen,
        this.waitTime,
        this.waitTimeCall,
        this.callRandval,
        this.reportRandval,
        this.commentRandval,
        this.astroDeviceToken,
        this.offerCategory,
        this.consultationPrice,
        this.videoCallCommissionM,
        this.ownerImage,
        this.videoCallPriceM,
        this.currentStatusVideoCall,
        this.freeMinut,
        this.introUrl,
        this.loginStatus,
        this.nextLogin,
        this.liveStatus,
        this.createdDatetime,
        this.image,
        this.offerSpecial,
        this.offerBest,
        this.offerDeal,
        this.offerNew});

  Records.fromJson(Map<String, dynamic> json) {
    astroStatus = json['astro_status'];
    astroSort = json['astro_sort'];
    id = json['id'];
    ownerName = json['owner_name'];
    status = json['status'];
    shopName = json['shop_name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    phone = json['phone'];
    alternateMobile = json['alternate_mobile'];
    currency = json['currency'];
    city = json['city'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    imgUrl = json['img_url'];
    idProof = json['id_proof'];
    bankProof = json['bank_proof'];
    state = json['state'];
    activate = json['activate'];
    gender = json['gender'];
    startingPrice = json['starting_price'];
    avgRating = json['avg_rating'];
    exp = json['exp'];
    skill = json['skill'];
    remedies = json['remedies'];
    mainexperties = json['mainexperties'];
    dob = json['dob'];
    language = json['language'];
    pincode = json['pincode'];
    experience = json['experience'];
    workingEx = json['working_ex'];
    ctc = json['ctc'];
    portalName = json['portalName'];
    bankAccountNumber = json['bank_account_number'];
    accountType = json['accountType'];
    ifscCode = json['ifscCode'];
    bankAccountName = json['bankAccountName'];
    panCardNo = json['panCardNo'];
    aadharCardNumber = json['aadharCardNumber'];
    callPriceM = json['call_price_m'];
    chatPriceM = json['chat_price_m'];
    chatCommission = json['chat_commission'];
    callCommission = json['call_commission'];
    astroDiscount = json['astro_discount'];
    commDesc = json['comm_desc'];
    shortBio = json['short_bio'];
    longBio = json['long_bio'];
    deviceId = json['device_id'];
    deviceToken = json['device_token'];
    token = json['token'];
    currentStatus = json['current_status'];
    currentStatusCall = json['current_status_call'];
    seen = json['seen'];
    waitTime = json['wait_time'];
    waitTimeCall = json['wait_time_call'];
    callRandval = json['call_randval'];
    reportRandval = json['report_randval'];
    commentRandval = json['comment_randval'];
    astroDeviceToken = json['astro_device_token'];
    offerCategory = json['offer_category'];
    consultationPrice = json['consultation_price'];
    videoCallCommissionM = json['video_call_commission_m'];
    ownerImage = json['owner_image'];
    videoCallPriceM = json['video_call_price_m'];
    currentStatusVideoCall = json['current_status_video_call'];
    freeMinut = json['free_minut'];
    introUrl = json['intro_url'];
    loginStatus = json['login_status'];
    nextLogin = json['next_login'];
    liveStatus = json['live_status'];
    createdDatetime = json['created_datetime'];
    image = json['image'];
    offerSpecial = json['offer_special'];
    offerBest = json['offer_best'];
    offerDeal = json['offer_deal'];
    offerNew = json['offer_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['astro_status'] = this.astroStatus;
    data['astro_sort'] = this.astroSort;
    data['id'] = this.id;
    data['owner_name'] = this.ownerName;
    data['status'] = this.status;
    data['shop_name'] = this.shopName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['alternate_mobile'] = this.alternateMobile;
    data['currency'] = this.currency;
    data['city'] = this.city;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['img_url'] = this.imgUrl;
    data['id_proof'] = this.idProof;
    data['bank_proof'] = this.bankProof;
    data['state'] = this.state;
    data['activate'] = this.activate;
    data['gender'] = this.gender;
    data['starting_price'] = this.startingPrice;
    data['avg_rating'] = this.avgRating;
    data['exp'] = this.exp;
    data['skill'] = this.skill;
    data['remedies'] = this.remedies;
    data['mainexperties'] = this.mainexperties;
    data['dob'] = this.dob;
    data['language'] = this.language;
    data['pincode'] = this.pincode;
    data['experience'] = this.experience;
    data['working_ex'] = this.workingEx;
    data['ctc'] = this.ctc;
    data['portalName'] = this.portalName;
    data['bank_account_number'] = this.bankAccountNumber;
    data['accountType'] = this.accountType;
    data['ifscCode'] = this.ifscCode;
    data['bankAccountName'] = this.bankAccountName;
    data['panCardNo'] = this.panCardNo;
    data['aadharCardNumber'] = this.aadharCardNumber;
    data['call_price_m'] = this.callPriceM;
    data['chat_price_m'] = this.chatPriceM;
    data['chat_commission'] = this.chatCommission;
    data['call_commission'] = this.callCommission;
    data['astro_discount'] = this.astroDiscount;
    data['comm_desc'] = this.commDesc;
    data['short_bio'] = this.shortBio;
    data['long_bio'] = this.longBio;
    data['device_id'] = this.deviceId;
    data['device_token'] = this.deviceToken;
    data['token'] = this.token;
    data['current_status'] = this.currentStatus;
    data['current_status_call'] = this.currentStatusCall;
    data['seen'] = this.seen;
    data['wait_time'] = this.waitTime;
    data['wait_time_call'] = this.waitTimeCall;
    data['call_randval'] = this.callRandval;
    data['report_randval'] = this.reportRandval;
    data['comment_randval'] = this.commentRandval;
    data['astro_device_token'] = this.astroDeviceToken;
    data['offer_category'] = this.offerCategory;
    data['consultation_price'] = this.consultationPrice;
    data['video_call_commission_m'] = this.videoCallCommissionM;
    data['owner_image'] = this.ownerImage;
    data['video_call_price_m'] = this.videoCallPriceM;
    data['current_status_video_call'] = this.currentStatusVideoCall;
    data['free_minut'] = this.freeMinut;
    data['intro_url'] = this.introUrl;
    data['login_status'] = this.loginStatus;
    data['next_login'] = this.nextLogin;
    data['live_status'] = this.liveStatus;
    data['created_datetime'] = this.createdDatetime;
    data['image'] = this.image;
    data['offer_special'] = this.offerSpecial;
    data['offer_best'] = this.offerBest;
    data['offer_deal'] = this.offerDeal;
    data['offer_new'] = this.offerNew;
    return data;
  }
}
