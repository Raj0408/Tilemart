
import 'package:flutter/material.dart';
import 'package:tilesapplication/constant/constant.dart';
import 'package:tilesapplication/model/title_detail.dart';
import 'tiles_type.dart';
import 'home.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
        ),
        title: Text(
          'Product',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 23.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20.0),
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              'Categories',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 32.0,
                  color: color_ora,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TabBar(

                controller: _tabController,
                indicatorColor: Colors.orange,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.orange,
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.only(right: 45.0),


                tabs: [
                  Tab(
                    child: Text('Wall Tiles',
                        style: tab_style),
                  ),
                  Tab(
                    child: Text('Floor Tiles',
                        style: tab_style),
                  ),
                  Tab(
                    child: Text('Bathroom Tiles',
                        style: tab_style),
                  ),
                  Tab(
                    child: Text('Kitchen Tiles',
                        style: tab_style),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                test_tile(tile_type: walltile),
                test_tile(tile_type: foloortile),
                test_tile(tile_type: bathroomtile),
                test_tile(tile_type: kitchen_tile),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
