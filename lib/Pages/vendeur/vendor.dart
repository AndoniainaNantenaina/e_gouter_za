// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:e_gouter_za/Model/produit.dart';
import 'package:e_gouter_za/Pages/products/product_description.dart';
import 'package:e_gouter_za/api/produitApi.dart';
import 'package:flutter/material.dart';

class Vendeur extends StatelessWidget {

  String vendeur_name;

  Vendeur({
    Key? key, 
    required this.vendeur_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(vendeur_name),
      ),
      body: FutureBuilder<List<Produit>>(
        future: ProduitApi.getProduitFromFile(context, 'assets/json/produit.json'),
        builder: (context, snapshot){
          final produits = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text("Error Produit not found"));
              } else{
                return ProduitApi.filterProduits(produits!, vendeur_name);
              }
          }
        },
      )
    );
  }
}