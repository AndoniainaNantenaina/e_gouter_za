// ignore_for_file: non_constant_identifier_names

class Product {
  final int id;
  final String name;
  final int prix;
  final String vendor;
  final String url_img;

  const Product({
    required this.id,
    required this.name,
    required this.prix,
    required this.vendor,
    required this.url_img
  });

  static Product fromJson(json) => Product(
    id: json['id'],
    name: json['name'],
    prix: json['prix'],
    vendor: json['Vendeur'],
    url_img: json['url_img']
  );
}