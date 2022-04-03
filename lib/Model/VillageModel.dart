class VillageModel {
  int? status;
  String? msg;
  List<VillageData>? data;

  VillageModel({this.status, this.msg, this.data});

  VillageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <VillageData>[];
      json['data'].forEach((v) {
        data!.add(new VillageData.fromJson(v));
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

class VillageData {
  String? villageId;
  String? villageName;

  VillageData({this.villageId, this.villageName});

  VillageData.fromJson(Map<String, dynamic> json) {
    villageId = json['village_id'];
    villageName = json['village_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['village_id'] = this.villageId;
    data['village_name'] = this.villageName;
    return data;
  }
}
