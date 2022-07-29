import 'package:flutter/material.dart';
import 'package:tilesapplication/Pages/detail_page.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/Pages/product.dart';

class GridClip extends StatelessWidget {
  const GridClip({
    Key? key,
    required this.Recently_Added,
  }) : super(key: key);

  final List<tiles_type> Recently_Added;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: const EdgeInsets.only(right: 23,left: 12),
      itemCount: Recently_Added.length,

      itemBuilder: (ctx, i) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(right: 12,left: 12),
          ),

          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detail_page(tileslist: Recently_Added,index: i,),
                ));
          },
          child: ClipRRect(

            borderRadius: BorderRadius.circular(10),
            child: Stack(

              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage(Recently_Added[i].path),
                  width: 1200,
                  height: 350,
                  fit: BoxFit.cover,

                ),
                Container(
                  margin: EdgeInsets.only(top: 160,left: 16),
                  child: Text(Recently_Added[i].name,style: TextStyle(
                      fontSize: 18,
                    color: Colors.black,
                  )),
                )
              ],
            ),
          ),

        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 15,
        mainAxisExtent: 200,
      ),
    );
  }
}