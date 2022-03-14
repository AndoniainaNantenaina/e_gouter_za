// ignore_for_file: deprecated_member_use, file_names

import 'package:e_gouter_za/Pages/search/search.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late String labelText = "Rechercher", hintText = "Rechercher";
  TextEditingController inController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Recherche"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                onTap: () => hintText = "",
                onSubmitted: (value) { 
                  inController.clear();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Search(query: value))
                  );
                },
                controller: inController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  labelText: "Rechercher",
                  labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
} 