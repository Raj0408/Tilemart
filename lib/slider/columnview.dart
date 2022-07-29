import 'package:flutter/material.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/slider/Carousel.dart';
import 'package:tilesapplication/constant/constant.dart';
import 'gridview_clip.dart';
import 'package:tilesapplication/Pages/detail_page.dart';


class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    required this.recent_product,
    required this.Trending_Product,
    required this.Recently_Added,
  }) : super(key: key);

  final List<tiles_type> recent_product;
  final List<tiles_type> Trending_Product;
  final List<tiles_type> Recently_Added;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(
        padding: EdgeInsets.only(top: 17,bottom: 17),
        child: Row(
          children: [
            Text("Recent Product" ,style: title),

          ],
        ),
      ),
      CarouselWidgete(
          product: recent_product,
          viewportFraction: 1,
      ),
      Padding(
        padding: EdgeInsets.only(top: 30,bottom: 24),
        child: Row(
          children: [
            Text("Trending Product" ,style: title),

          ],
        ),
      ),
      GridClip(Recently_Added: Trending_Product),
      Padding(
        padding: EdgeInsets.only(top: 30,bottom: 24),
        child: Row(
          children: [
            Text("Recent Added" ,style:title),

          ],
        ),
      ),
      GridClip(Recently_Added: Recently_Added),
    ]);
  }
}




// child: Column(
// children: [
// ListView(
// children: [
// GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 4),
//
// itemCount : 5,
// itemBuilder: (context,index){
// return Card(
// color: Colors.white,
// child: Stack(
// children: [
// Image(image: AssetImage(Trending_Product[index].path)),
// Text(Trending_Product[index].name),
// ],
// ),
// );
// }),
// ],
//
// ),
// ],
//
// )