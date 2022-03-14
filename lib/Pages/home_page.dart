// ignore_for_file: camel_case_types

import 'package:e_gouter_za/Pages/liste_des_produits/listProduits.dart';
import 'package:e_gouter_za/Pages/search/searchPage.dart';
import 'package:flutter/material.dart';

import 'navigation/NavigationDrawerWidget.dart';

class Home_page extends StatefulWidget {
  const Home_page({ Key? key }) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () { Scaffold.of(context).openDrawer(); }, 
            icon: const Icon(Icons.restaurant_menu, color: Colors.white,)
          ),
        ),
        elevation: 0,
        title: const Text("E-GOUTER'ZA", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const SearchPage()
                )
              );
            }, 
            icon: const Icon(Icons.search_sharp, color: Colors.white,)
          )
        ],
      ),
      body: const ListBuy(),
    );
  }
}