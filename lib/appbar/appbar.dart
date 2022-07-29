import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilesapplication/Pages/contact_us.dart';
import  'package:tilesapplication/Pages/product.dart';
import 'package:tilesapplication/Pages/contact_page.dart';
import 'package:tilesapplication/Pages/about_page.dart';


import '../Pages/home.dart';

class CustomBarWidget extends StatefulWidget {

  @override
  State<CustomBarWidget> createState() => _CustomBarWidgetState();
}

class _CustomBarWidgetState extends State<CustomBarWidget> {


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int selectedindex = 0;
  final List<Widget> _children = [
     homepage(),
    ProductPage(title: 'product pge',),
    about_page(),
    contactUs(),

  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _children[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.orange,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'Products',
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'About Us',
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Contact us',
                backgroundColor: Colors.orange,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.shifting,
            iconSize: 25,
          ),
        ),
      ),
    );
  }
}
