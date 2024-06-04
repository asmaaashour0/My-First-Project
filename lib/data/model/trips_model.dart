class ItemsModel {
  int? id;
  int? categoryId;
  String? name;
  int? price;
  String? details;
  String? distenation;
  Null? createdAt;
  Null? updatedAt;

  ItemsModel(
      {this.id,
      this.categoryId,
      this.name,
      this.price,
      this.details,
      this.distenation,
      this.createdAt,
      this.updatedAt});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    details = json['details'];
    distenation = json['distenation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['details'] = this.details;
    data['distenation'] = this.distenation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
