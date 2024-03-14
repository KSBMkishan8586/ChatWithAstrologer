class OtpModel {
  String? status;
  String? id;
  String? number;
  String? username;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? email;
  String? message;
  String? isNewUser;

  OtpModel(
      {this.status,
        this.id,
        this.number,
        this.username,
        this.firstName,
        this.lastName,
        this.gender,
        this.image,
        this.email,
        this.message,
        this.isNewUser});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    number = json['number'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    image = json['image'];
    email = json['email'];
    message = json['message'];
    isNewUser = json['is_new_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['id'] = id;
    data['number'] = number;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['email'] = email;
    data['message'] = message;
    data['is_new_user'] = isNewUser;
    return data;
  }
}
