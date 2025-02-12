class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        image: json['image'],
        price: json['price'].toDouble(),
        title: json['title']);
  }
}
