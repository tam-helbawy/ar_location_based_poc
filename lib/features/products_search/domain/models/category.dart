class Category{
  final String name;
  final int id;
  final String imageUrl;

  Category({required this.name, required this.id, required this.imageUrl});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      imageUrl: json['image'],
      name: json['name'],
      id: json['id'],
    );
  }
}