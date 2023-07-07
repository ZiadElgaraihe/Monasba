class login_model {
  String? status;
  String? token;
  Data? data;

  login_model({this.status, this.token, this.data});

  login_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? profileImg;
  String? role;
  bool? active;
  String? sId;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? country;
  String? city;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.profileImg,
      this.role,
      this.active,
      this.sId,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.country,
      this.city,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    profileImg = json['profileImg'];
    role = json['role'];
    active = json['active'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    country = json['country'];
    city = json['city'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileImg'] = this.profileImg;
    data['role'] = this.role;
    data['active'] = this.active;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['country'] = this.country;
    data['city'] = this.city;
    data['phoneNumber'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
