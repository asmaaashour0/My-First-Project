class TripsCoponsModel {
  int? id; ///////I Editing
  String? name;
  String? image;
  Null? createdAt;
  Null? updatedAt;

  TripsCoponsModel(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt});

  TripsCoponsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
