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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['price'] = price;
    return data;
  }

  List<Product> getMockProductList() {
    List<Product> list = [
      Product(
          id: "1",
          name: "T-Bone Slice 300g.",
          imageUrl: "https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=200&q=200",
          price: 250),
      Product(
          id: "2",
          name: "Eggs No.1 Pack 30",
          imageUrl: "https://images.unsplash.com/photo-1516448620398-c5f44bf9f441?fit=crop&w=200&q=200",
          price: 149),
      Product(
          id: "3",
          name: "Frozen Atlantic Salmon 125g.",
          imageUrl: "https://images.unsplash.com/photo-1599084993091-1cb5c0721cc6?fit=crop&w=200&q=200",
          price: 98),
      Product(
          id: "4",
          name: "White Prawn 30pcs per kg.",
          imageUrl: "https://images.unsplash.com/photo-1504309250229-4f08315f3b5c?fit=crop&w=200&q=200",
          price: 299),
      Product(
          id: "5", name: "Broccoli 1kg.", imageUrl: "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?fit=crop&w=200&q=200", price: 96),
      Product(
          id: "6", name: "Caabbage 3kg.", imageUrl: "https://images.unsplash.com/photo-1611105637889-3afd7295bdbf?fit=crop&w=200&q=200", price: 129),
      Product(
          id: "7",
          name: "Itambé natural milk 1L.",
          imageUrl: "https://images.unsplash.com/photo-1563636619-e9143da7973b?fit=crop&w=200&q=200",
          price: 79),
    ];

    return list;
  }
}
