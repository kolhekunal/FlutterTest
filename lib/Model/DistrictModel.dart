class DistrictModel {
  int? status;
  String? msg;
  List<DistrictData>? data;

  DistrictModel({this.status, this.msg, this.data});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DistrictData>[];
      json['data'].forEach((v) {
        data!.add(new DistrictData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictData {
  String? disrictId;
  String? districtName;

  DistrictData({this.disrictId, this.districtName});

  DistrictData.fromJson(Map<String, dynamic> json) {
    disrictId = json['disrict_id'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disrict_id'] = this.disrictId;
    data['district_name'] = this.districtName;
    return data;
  }
}
