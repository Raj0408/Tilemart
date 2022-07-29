import 'package:flutter/material.dart';
import 'package:tilesapplication/Pages/search_page.dart';
import 'package:tilesapplication/slider/columnview.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/model/title_detail.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<tiles_type> all_tiles = alltiles;

  TextEditingController _controller = TextEditingController();

 String query2 = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160.0,
              child: Stack(
                children: <Widget>[
                  Container(

                    decoration: BoxDecoration( borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),

                    ),
                      color: Colors.orange,),
                    width: MediaQuery.of(context).size.width,
                    height: 130.0,

                    child: Center(
                      child: Text(
                        "Tiles Application",
                        style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5), width: 1.0),
                            color: Colors.white),
                        child: Row(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left : 20),
                                child: TextField(

                                  controller: _controller,
                                  textAlign: TextAlign.left,
                                  onChanged: (value) {
                                    query2 = value;

    },
                                  decoration: InputDecoration(

                                    floatingLabelAlignment: FloatingLabelAlignment.center,
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    alignLabelWithHint: true
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.orangeAccent,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => search_page(query: query2,)));
                                FocusManager.instance.primaryFocus?.unfocus();
                                _controller.clear();
                              },
                            ),

                          ],
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),


            ColumnWidget(recent_product: recent_product, Trending_Product: Trending_Product, Recently_Added: Recently_Added),

          ],
        ),
      ),
    );
  }
}
