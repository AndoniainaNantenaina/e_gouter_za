import 'package:e_gouter_za/Pages/liste_des_commandes/liste_commandes.dart';
import 'package:flutter/material.dart';

class ListAchat extends StatefulWidget {
  const ListAchat({ Key? key }) : super(key: key);

  @override
  State<ListAchat> createState() => _ListAchatState();
}

class _ListAchatState extends State<ListAchat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vos commandes"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const ListeCommandes(),
    );
  }
}