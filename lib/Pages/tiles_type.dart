import 'package:flutter/material.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/slider/product_gridview.dart';

class test_tile extends StatelessWidget {
  const test_tile({
    Key? key,
    required this.tile_type,
  }) : super(key: key);

  final List<tiles_type> tile_type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: [
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 200,
                ),
                itemCount: tile_type.length,
                itemBuilder: (context, i) {
                  return Product_gridview(floortiles: tile_type,i: i,);
                }

            ),
          )
        ],
      ),
    );
  }
}

