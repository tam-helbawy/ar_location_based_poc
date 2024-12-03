class Product{
  String name;
  String id;
  String description;
  double price;
  String imageUrl;
  Product({required this.name, required this.description, required this.price, required this.imageUrl, required this.id});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      id: json['id'].toString(),
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['images'].first,
    );
  }
}