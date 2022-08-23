class ActivityModel {
  int? id;
  String? activityType;
  String? institution;
  String? when;
  String? objective;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  ActivityModel(
      {this.id,
      this.activityType,
      this.institution,
      this.when,
      this.objective,
      this.remarks,
      this.createdAt,
      this.updatedAt});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityType = json['activityType'];
    institution = json['institution'];
    when = json['when'];
    objective = json['objective'];
    remarks = json['remarks'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activityType'] = this.activityType;
    data['institution'] = this.institution;
    data['when'] = this.when;
    data['objective'] = this.objective;
    data['remarks'] = this.remarks;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  static List<ActivityModel> fromJsonList(List list) {
    if (list.isEmpty) return List<ActivityModel>.empty();
    return list.map((item) => ActivityModel.fromJson(item)).toList();
  }
}
