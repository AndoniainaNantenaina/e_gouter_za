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
        child: Column(),
      ),
    );
  }
}