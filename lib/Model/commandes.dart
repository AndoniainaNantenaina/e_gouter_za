// ignore_for_file: non_constant_identifier_names, invalid_required_positional_param

class Commandes {
  final int id;
  final String name;
  final int prix;
  final String vendor;

  Commandes({
    required this.id, 
    required this.name, 
    required this.prix, 
    required this.vendor
  });

  static Commandes fromJson(json) => Commandes(
    id: json["id"], 
    name: json["name"], 
    prix: json["prix"], 
    vendor: json["Vendeur"]);
}