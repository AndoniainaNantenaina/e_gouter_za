// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class A_Propos extends StatefulWidget {
  const A_Propos({ Key? key }) : super(key: key);

  @override
  State<A_Propos> createState() => _A_ProposState();
}

class _A_ProposState extends State<A_Propos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("A propos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/andoniaina.jpg",
                    scale: 0.1,            
                  ),
                ),
                const Text("E-GOUTER'ZA", style: TextStyle(fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Une application développé par ANDONIAINA NANTENAINA Nomenjanahary Joel André avec Flutter pendant un projet d'examen chez ESTI"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.copyright),
                      Text("2022"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}