import 'package:e_gouter_za/Pages/a_propos.dart';
import 'package:e_gouter_za/Pages/categories/categorie.dart';
import 'package:flutter/material.dart';

import '../liste_des_achats/listAchat.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 50),
          const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "E-GOUTER'ZA", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  )
                )
              ),
          ),
          buildMenuItem(
            text: "Acceuil", 
            icon: Icons.home_filled, 
            onTap: (){
              Navigator.of(context).pop();
            }
          ),
          buildMenuItem(
            text: "Vos commandes",
            icon: Icons.shopping_cart,
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> const ListAchat()
                )
              );
            }
          ),
          buildMenuItem(
            text: "Categorie",
            icon: Icons.sort,
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const Categorie())
              );
            }
          ),
          buildMenuItem(
            text: "A propos", 
            icon: Icons.help_center, 
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const A_Propos()
                )
              );
            }
          )            
        ],
      ),
    );
  }

  //  Fonction de construction des menus dans le Drawer
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required Function() onTap
  }) {
    const color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      onTap: onTap,
    );
  }
}