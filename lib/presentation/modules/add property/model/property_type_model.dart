class PropertyTypeModel {
  int? id;
  String? name;
  String? mainType;

  PropertyTypeModel({this.id, this.name, this.mainType});

  PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainType = json['main_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['main_type'] = this.mainType;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PropertyTypeModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
