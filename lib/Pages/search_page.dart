import 'package:flutter/material.dart';
import 'package:tilesapplication/Pages/tiles_type.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/model/title_detail.dart';
import 'package:tilesapplication/slider/product_gridview.dart';


class search_page extends StatefulWidget {
  // const search_page({Key? key}) : super(key: key);


  String query;
search_page({ required this.query});


  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {

  List<tiles_type> _tilesname = [];
  @override
  void initState() {
    _tilesname = alltiles;
    _runFilter();
    super.initState();
  }

  void _runFilter(){
     List<tiles_type> results = [];

     if(widget.query.isEmpty)
       {
         results = alltiles;
       }

     else {
       results = alltiles.where((tiles_type) => tiles_type.name.toLowerCase().contains(widget.query.toLowerCase())).toList();

     }

     setState(() {
       _tilesname = results;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for ${widget.query}'),
        backgroundColor: Colors.orange,
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Container(
          //   padding: EdgeInsets.only(left: 23,top: 20,bottom: 12),
          //   child: Text(
          //     'Result for ${widget.query}',
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //
          //     ),
          //   ),
          // ),
          Expanded(
            child:
            _tilesname.isNotEmpty?


                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 200,
                    ),
                    itemCount: _tilesname.length,
                    itemBuilder: (context, i) {
                      return Product_gridview(floortiles: _tilesname,i: i,);
                    }

                )


                : Center(
                  child: const Text(
              'No results found',
              style: TextStyle(fontSize: 24),
            ),
                ),
          ),
        ],
      ),
    );
  }
}
