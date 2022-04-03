class LoginModel {
  int? status;
  String? msg;
  Data? data;

  LoginModel({this.status, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? mobile;
  String? district;
  String? mandal;
  String? village;
  String? status;
  String? mobileVerify;
  String? userType;

  Data(
      {this.name,
        this.mobile,
        this.district,
        this.mandal,
        this.village,
        this.status,
        this.mobileVerify,
        this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    district = json['district'];
    mandal = json['mandal'];
    village = json['village'];
    status = json['status'];
    mobileVerify = json['mobile_verify'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['district'] = this.district;
    data['mandal'] = this.mandal;
    data['village'] = this.village;
    data['status'] = this.status;
    data['mobile_verify'] = this.mobileVerify;
    data['user_type'] = this.userType;
    return data;
  }
}
