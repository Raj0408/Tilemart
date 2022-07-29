import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:tilesapplication/Pages/detail_page.dart';
import 'package:tilesapplication/Pages/camera_page.dart';
import 'package:tilesapplication/constant/constant.dart';

class Product_gridview extends StatelessWidget {
   const Product_gridview({
    Key? key,
    required this.floortiles,
    required this.i,
  }) : super(key: key);

  final List<tiles_type> floortiles;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push( context,
              MaterialPageRoute(
                builder: (context) => detail_page(tileslist: floortiles,index: i,),
              ));
        },
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Stack(

            children: [

              ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                child: Image(
                  image: AssetImage(floortiles[i].path),
                  fit: BoxFit.cover,
                  height: 140,
                  width: 300,


                  ),
              ),


              // Padding(
              //   padding: const EdgeInsets.only(top: 113,left: 8,right: 0),
              //   child: SizedBox(
              //     height: 23,
              //     child: Text(
              //       floortiles[i].name,
              //       style: const TextStyle(
              //           color: Colors.black,
              //           fontFamily: 'Roboto',
              //           fontSize: 17.0,
              //           fontWeight: FontWeight.bold
              //       ),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 110,left: 85,right: 0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  child: Container(
                    color: prize_color,
                    height: 30,
                    width: 100,

                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0,top: 0,bottom: 0),
                        child: Text(
                          '₹ ${floortiles[i].prize}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 140),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera,
                        color: Colors.green,
                        size: 20,
                      ),
                      TextButton(
                        child: const Text(
                          'Try Now',
                          style:
                          TextStyle(fontSize: 15.0,
                              fontFamily: 'Roboto'),
                        ),
                        onPressed: () async {
                          await availableCameras().then(
                                (value) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CameraPage(
                                          camera: value[0],
                                          tilesdata: floortiles[i],
                                        ),
                                  ),
                                ),
                          );
                        },
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}