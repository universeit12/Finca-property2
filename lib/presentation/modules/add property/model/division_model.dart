class DivisionModel {
  int? id;
  String? name;
  String? image;

  DivisionModel({this.id, this.name, this.image});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }

  // Override equality operators to avoid duplicate issues
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DivisionModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
