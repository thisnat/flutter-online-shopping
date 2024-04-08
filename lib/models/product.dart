class Product {
  String? id;
  String? name;
  String? imageUrl;
  int? price;

  Product({this.id, this.name, this.imageUrl, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['price'] = this.price;
    return data;
  }
}
