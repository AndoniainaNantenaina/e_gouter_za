import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_gouter_za/Model/commandes.dart';

class CommandesApi {
  static Future<List<Commandes>> getCommandesLocal(BuildContext context, String file) async{
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString(file);
    final body = json.decode(data);
    
    return body.map<Commandes>(Commandes.fromJson).toList();
  }  
}