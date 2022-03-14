import 'package:flutter/material.dart';
import 'package:e_gouter_za/Model/commandes.dart';
import 'package:e_gouter_za/api/commandesApi.dart';

class ListeCommandes extends StatelessWidget {
  const ListeCommandes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Commandes>>(
      future: CommandesApi.getCommandesLocal(context, 'assets/json/commandes.json'),
      builder: (context, snapshot){
        final produits = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(child: Text('Erreur'));                
            } else {
              return buildCommandes(produits!);
            }
        }
      },
    ),
    );
  }

  Widget buildCommandes(List<Commandes> commandes) => ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: commandes.length,
    itemBuilder: (context, index) {
      final commande = commandes[index];

      return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        child: Card(
          color: Colors.redAccent.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: SizedBox(
                  height: 15,
                  child: Text(
                    commande.name, 
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                subtitle: Text(commande.vendor),      
                trailing: Text(commande.prix.toString() + " Ar"),          
              ),
            ],
          ),
        ),
      );
    },
  );
}