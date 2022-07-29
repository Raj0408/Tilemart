import 'package:flutter/material.dart';

class about_page extends StatelessWidget {
  const about_page({Key? key}) : super(key: key);

  final double coverHeight = 280;
  final double profileHeight = 104;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return SingleChildScrollView(
      child: Column(
        // appBar: AppBar(
        //   title: Text('About Us'),
        //   backgroundColor: Colors.grey,
        // ),

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 0),
            child: buildProfileImage(),
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            title: Center(
              child: Text(
                'Tiles Application',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,letterSpacing: 2),
              ),
            ),
            //   subtitle: Center(
            //       child: Text('Inspired By Imagination',
            //           style: TextStyle(color: Colors.black, fontSize: 15))),
            // )
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 0),
            child: ListTile(
              title: Center(
                child: Text(
                  'About Us',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 2),
                ),
              ),
            ),
          ),


            Padding(
              padding: EdgeInsets.only(top: 0),
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context ,i) => Padding(
                padding: const EdgeInsets.only(top: 13,left: 12,right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(


                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 0,right: 10,left: 10),
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
                                letterSpacing: 1,
                                height: 1.25,
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Montserrat'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),),
            ),
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
            'images/about.jpg',
            width: double.maxFinite,
            height: coverHeight,
            fit: BoxFit.fill),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage('images/dummy_logo.png'),
      );

  Widget buildContant() => Container(
        child: Text(
          "Hi",
        ),
      );
}
class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      child: Container(


        height: 12.0,
        width: 25.0,
        decoration:  BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}