import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:tilesapplication/Pages/detail_page.dart';
import 'Pages/search_page.dart';
import 'appbar/appbar.dart';
import 'Pages/contact_us.dart';
import 'Pages/product.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => CustomBarWidget(),
        'ProductPage' : (context) => ProductPage(title: 'This is Product Page',),
        detail_page.id : (context) => detail_page(tileslist: [], index: 0,),
        'SearchPage' : (context) => search_page(query: '',),
        'ContactPage' : (context) => contactUs(),
      }
    );
  }
}
