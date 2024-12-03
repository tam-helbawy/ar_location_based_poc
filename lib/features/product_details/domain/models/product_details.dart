class ProductDetails{
  String name;
  String description;
  double price;
  List<String> imageUrls;
  ProductDetails({required this.name, required this.description, required this.price, required this.imageUrls});
  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      name: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrls: (json['images'] as List).map((e) => e.toString()).toList()
    );
  }
}