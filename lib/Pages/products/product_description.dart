// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ProductDesc extends StatelessWidget {

  String name; 
  int prix; 
  String imgUrl;

  ProductDesc({ required this.name, required this.prix, required this.imgUrl });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(name)
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
                  child: Image.asset(imgUrl, fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Prix : " + prix.toString() + " Ar",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black54
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {}, 
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(top: 15, bottom: 15)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_shopping_cart),
                    Text("Commander", style: TextStyle(),)
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