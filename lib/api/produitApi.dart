// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:convert';

import 'package:e_gouter_za/Pages/products/product_description.dart';
import 'package:flutter/material.dart';
import 'package:e_gouter_za/Model/produit.dart';

class ProduitApi {

  static Future<List<Produit>> getProduitFromFile(BuildContext context, String file) async{
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString(file);
    final body = json.decode(data);
    
    return body.map<Produit>(Produit.fromJson).toList();
  }  

  static Widget searchProduit(List<Produit> produits, String search) => ListView.builder(
    itemCount: produits.length,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      if (produits[index].name.toLowerCase().contains(search.toLowerCase()) || 
          produits[index].vendor.toLowerCase().contains(search.toLowerCase())) {
        return Padding(
        padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 8,
            color: Colors.orangeAccent.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(produits[index].image_url, height: 200, fit: BoxFit.cover)
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      produits[index].name, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    )
                  )
                ),
                SizedBox(
                  child: Text(produits[index].prix.toString() + " Ar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> ProductDesc(
                        name: produits[index].name, 
                        prix: produits[index].prix, 
                        imgUrl: produits[index].image_url, 
                        nbCommande: 1,
                        desc: produits[index].desc,
                        vendor: produits[index].vendor,
                      ))
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5), 
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Text(produits[index].vendor.toString())
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    }
  );

  static Widget listCategorie(String title, String logoUrl, Function() onPressed){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 8,
        child: ListTile(
          leading: Image.asset(
            logoUrl
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          onTap: onPressed,
        ),
      ),
    );
  }

  static Widget listAll(List<Produit> produits) => ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: produits.length,
    itemBuilder: (context, index) {

      final produit = produits[index];

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=> ProductDesc(
                name: produit.name, 
                prix: produit.prix, 
                imgUrl: produit.image_url, 
                nbCommande: 1,
                desc: produit.desc,
                vendor: produit.vendor,
              )
            )
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 8,
            color: Colors.orangeAccent.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(produit.image_url, height: 200, fit: BoxFit.cover)
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      produit.name, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    )
                  )
                ),
                SizedBox(
                  child: Text(produit.prix.toString() + " Ar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> ProductDesc(
                        name: produit.name, 
                        prix: produit.prix, 
                        imgUrl: produit.image_url, 
                        nbCommande: 1,
                        desc: produit.desc,
                        vendor: produit.vendor,
                      ))
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5), 
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Text(produit.vendor.toString())
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      );
    },
  );

  static Widget filterProduits(List<Produit> produits, String vendeur_name_filter) => ListView.builder(
    itemCount: produits.length,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      if (produits[index].vendor == vendeur_name_filter) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 8,
            color: Colors.orangeAccent.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(produits[index].image_url, height: 200, fit: BoxFit.cover)
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      produits[index].name, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    )
                  )
                ),
                SizedBox(
                  child: Text(produits[index].prix.toString() + " Ar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> ProductDesc(
                        name: produits[index].name, 
                        prix: produits[index].prix, 
                        imgUrl: produits[index].image_url, 
                        nbCommande: 1,
                        desc: produits[index].desc,
                        vendor: produits[index].vendor,
                      ))
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5), 
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Text(produits[index].vendor.toString())
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    }
  );

  static toJson(Produit commande, String file) async{
    String data = json.encode({
      "id": commande.id,
      "name": commande.name,
      "prix": commande.prix,
      "Vendeur": commande.vendor,
      "date": DateTime.now().toString()
    });
  }
}