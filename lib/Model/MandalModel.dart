class MandalModel {
  int? status;
  String? msg;
  List<MandalData>? data;

  MandalModel({this.status, this.msg, this.data});

  MandalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <MandalData>[];
      json['data'].forEach((v) {
        data!.add(new MandalData.fromJson(v));
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

class MandalData {
  String? mandalId;
  String? mandalName;

  MandalData({this.mandalId, this.mandalName});

  MandalData.fromJson(Map<String, dynamic> json) {
    mandalId = json['mandal_id'];
    mandalName = json['mandal_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mandal_id'] = this.mandalId;
    data['mandal_name'] = this.mandalName;
    return data;
  }
}
