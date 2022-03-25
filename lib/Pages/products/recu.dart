// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RecuProduit extends StatelessWidget {
  
  String produitName;
  String vendeur;
  int nombreCommande;
  int prixTotal;
  int prixUnit;

  RecuProduit(
    { 
      Key? key, 
      required this.produitName, 
      required this.vendeur,
      required this.nombreCommande, 
      required this.prixTotal,
      required this.prixUnit
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            shadowColor: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.price_check),
                  Text(
                    "Votre commande a été bien reçu"
                    "\n\nProduit : " + produitName +
                    "\nVendeur : " + vendeur +
                    "\nPU : " + prixUnit.toString() + " Ar"
                    "\nNombre : " + nombreCommande.toString() +
                    "\nTOTAL : " + (prixUnit * nombreCommande).toString() + " Ar",
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}