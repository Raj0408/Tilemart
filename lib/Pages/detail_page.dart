import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilesapplication/appbar/appbar.dart';
import 'package:tilesapplication/model/tiles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tilesapplication/constant/constant.dart';
import 'camera_page.dart';
import 'package:camera/camera.dart';


class detail_page extends StatelessWidget {

  static String id = 'product_page';
  List<tiles_type> tileslist;
  final int index ;
  detail_page({required this.tileslist,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/icons/heart.svg",
                    height: 20,
                  )))
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 0),
          child: ClipRRect(

            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset(
              tileslist[index].path,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding-16,
        ),
        Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding -1,
                  defaultPadding, defaultPadding-16),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius * 1.5),
                    topRight: Radius.circular(defaultBorderRadius * 1.5)),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [

                  Text(tileslist[index].name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 26,
                        letterSpacing: 2
                      ),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "₹" +"${tileslist[index].prize}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SizedBox(
                          child: Container(
                            color: Colors.black,
                            height: 23,
                            width: 1,
                          ),
                      ),
                       ),
                      Text(

                        "20 pcs",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 0,right: 10),
                              child:Text(
                                '•',
                                style: TextStyle(
                                  fontSize: 30
                                ),
                              ),
                            ),
                            Flexible(

                              child: Text(
                                  """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy""",
                               style: TextStyle(
                                 fontFamily: 'Montserrat',
                               ),
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: EdgeInsets.all(10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 0,right: 10),
                              child:Text(
                                '•',
                                style: TextStyle(
                                    fontSize: 30
                                ),
                              ),
                            ),
                            Flexible(

                              child: Text(
                                """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy""",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(
                    height: defaultPadding * 1.5,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () async {
                            await availableCameras().then(
                                  (value) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CameraPage(
                                            camera: value[0],
                                            tilesdata: tileslist[index],
                                          ),
                                    ),
                                  ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange, shape: const StadiumBorder()),
                          child: const Text(
                            "use camera",
                          )),
                    ),
                  ),
                ]),
              ),
            ))
      ]),
    );
  }
}
