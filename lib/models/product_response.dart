class ProductResponse {
  List<Product> products = [];

  ProductResponse({
    required this.products,
  });

  ProductResponse.fromJson(List<dynamic> data) {
    for (var element in data) {
      products.add(Product.fromJson(element));
    }
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        price = json['price'].toDouble() as double,
        description = json['description'] as String,
        image = json['image'] as String;
}
