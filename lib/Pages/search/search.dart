import 'package:e_gouter_za/Model/produit.dart';
import 'package:e_gouter_za/api/produitApi.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  final String query;

  const Search({ Key? key, required this.query }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Resultat : " + query),
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
                return ProduitApi.searchProduit(produits!, query);
              }
          }
        },
      )
    );
  }
}