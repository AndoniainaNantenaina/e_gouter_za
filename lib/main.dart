import 'package:e_gouter_za/Pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-GOUTER'ZA",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home_page(),
    );
  }
}
