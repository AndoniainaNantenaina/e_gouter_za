// ignore_for_file: camel_case_types, file_names

import 'package:e_gouter_za/Model/produit.dart';
import 'package:e_gouter_za/api/produitApi.dart';
import 'package:flutter/material.dart';

class ListBuy extends StatelessWidget {
  const ListBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    body: FutureBuilder<List<Produit>>(
      future: ProduitApi.getProduitFromFile(context, 'assets/json/produit.json'),
      builder: (context, snapshot){
        final produits = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(child: Text('Erreur'));                
            } else {
              return ProduitApi.listAll(produits!);
            }
        }
      },
    ),
  );  
}
