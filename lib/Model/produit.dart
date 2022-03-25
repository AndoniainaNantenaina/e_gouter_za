// ignore_for_file: non_constant_identifier_names, invalid_required_positional_param

class Produit {
  final int id;
  final String name;
  final int prix;
  final String vendor;
  final String image_url;
  final String desc;

  const Produit({
    required this.id, 
    required this.name, 
    required this.prix, 
    required this.vendor,
    required this.image_url,
    required this.desc
  });

  static Produit fromJson(json) => Produit(
    id: json['id'], 
    name: json['name'], 
    prix: json['prix'], 
    vendor: json['Vendeur'],
    image_url: json['url_img'], 
    desc: json['desc']
  );
}