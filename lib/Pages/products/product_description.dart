// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:e_gouter_za/Pages/products/recu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDesc extends StatefulWidget {

  String name; 
  int prix; 
  int nbCommande;
  String imgUrl;
  String desc;
  String vendor;

  ProductDesc({ 
    required this.name, 
    required this.prix, 
    required this.imgUrl, 
    required this.nbCommande,
    required this.desc,
    required this.vendor
  });

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(widget.name)
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30), 
                bottomRight: Radius.circular(30)
              ),
              child: SizedBox(
                height: 300, child: Container(
                  color: Colors.redAccent,
                  child: Image.asset(widget.imgUrl, fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.coveredByYourGrace(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                  Text(
                    widget.vendor,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prix : " + widget.prix.toString() + " Ar",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (widget.nbCommande > 1) {
                              widget.nbCommande--;
                            }
                          });
                        },
                        child: const Text("-", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                          minimumSize: MaterialStateProperty.all(Size.zero)
                        ),
                      ),
                      Text(
                        widget.nbCommande.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            widget.nbCommande++;
                          });
                        }, 
                        child: const Text("+", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                          minimumSize: MaterialStateProperty.all(Size.zero)
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(widget.desc, style: const TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // ProduitApi.toJson(Produit(id: 1, name: name, prix: prix, vendor: "vendor", image_url: "image_url"), "assets/json/commandes.json");
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => RecuProduit(
                        produitName: widget.name, 
                        vendeur: widget.vendor,
                        nombreCommande: widget.nbCommande, 
                        prixTotal: widget.prix,
                        prixUnit: widget.prix,
                      ),
                    )
                  );
                }, 
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(top: 15, bottom: 15)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_shopping_cart),
                    Text("Commander")
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}