import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/constant/constant.dart';
import 'package:tilesapplication/Pages/detail_page.dart';


class CarouselWidgete extends StatelessWidget {
  const CarouselWidgete({
    Key? key,
    required this.product,
    required this.viewportFraction
  }) : super(key: key);

  final List<tiles_type> product;
  final double viewportFraction ;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: true,
        viewportFraction: 0.97
      ),

      itemBuilder: (context ,i,_){
        return TextButton(

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => detail_page(tileslist: product,index: i,),
          ));
        },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(

              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage(product[i].path),
                  width: 1030,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(top: 140,left: 18),
                  child: Text(product[i].name,style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',),),
                )
              ],
            ),
          ),
        );
      },

    );
  }
        

  }


//
// items: product
//     .map((e) {
//
// return Stack(
//
// fit: StackFit.expand,
// children: <Widget>[
// TextButton(
// onPressed: (){
// Navigator.push(context, MaterialPageRoute(
// builder: (context) => detail_page(tileslist: product,index: index,),
// ));
// },
// child: Image(
// image: AssetImage(e.path),
// width: 1030,
// height: 350,
// fit: BoxFit.cover,
// ),
// ),
// Container(
// margin: EdgeInsets.only(top: 140,left: 18),
// child: Text(e.name,style: TextStyle(
// color: Colors.black,
// fontSize: 22,
// fontWeight: FontWeight.w400,
// fontFamily: 'Montserrat',),),
// )
// ],
// );
// })
// .toList(),