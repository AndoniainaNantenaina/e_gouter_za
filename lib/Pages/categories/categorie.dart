import 'package:e_gouter_za/Pages/vendeur/vendor.dart';
import 'package:e_gouter_za/api/produitApi.dart';
import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  const Categorie({ Key? key }) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Categorie"),
        centerTitle: true,
      ),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            ProduitApi.listCategorie(
              "La gastronomie pizza", 
              "assets/images/logo_gastro.png",
              (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> Vendeur(
                      vendeur_name: 'Gastro pizza'
                    )
                  )
                );
              }
            ),
            ProduitApi.listCategorie(
              "Extra pizza", 
              "assets/images/logo_extra.jpg",
              (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> Vendeur(
                    vendeur_name: 'Extra pizza' 
                  )
                ));
              }  
            ),
            ProduitApi.listCategorie(
              "Happy king", 
              "assets/images/logo_extra.jpg",
              (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> Vendeur(
                    vendeur_name: 'Happy king' 
                  )
                ));
              }  
            ),
          ]
        ),
      ),
    );
  }
}