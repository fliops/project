import 'package:flutter/material.dart';
import 'package:stor/pege/homepage.dart';
import 'package:stor/pege/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // ignore: prefer_const_constructors
        HomePage.id: (context) => HomePage(),
        UpdataProductPage.id:(context)=> UpdataProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
