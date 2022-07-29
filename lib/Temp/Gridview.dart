import 'package:flutter/material.dart';
import 'package:tilesapplication/model/tiles.dart';

class Gridview extends StatelessWidget {
  const Gridview({
    Key? key,
    required this.Trending_Product,
  }) : super(key: key);

  final List<tiles_type> Trending_Product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: const EdgeInsets.only(right: 23,left: 12),
      itemCount: Trending_Product.length,
      itemBuilder: (ctx, i) {
        return Card(
          shadowColor: Colors.black,
          semanticContainer: true,
          color: Colors.orange,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),

            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Image(image: AssetImage(Trending_Product[i].path),fit: BoxFit.fill,)
                    ),
                    Text(
                      Trending_Product[i].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 200,
      ),
    );
  }
}