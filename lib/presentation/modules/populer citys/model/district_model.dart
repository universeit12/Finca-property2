class DistrictModel {
  int? id;
  String? divisionId;
  String? divisionName;
  String? image;
  String? name;

  DistrictModel(
      {this.id, this.divisionId, this.divisionName, this.image, this.name});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    divisionName = json['division_name'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['division_name'] = this.divisionName;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}