import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class contactUs extends StatelessWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactUs(
        logo: AssetImage(
          'images/dummy_logo.png',
        ),


        email: '',
        companyName: 'Tiles Application',
        companyFontSize:26,
        phoneNumber: '919016063607',
        dividerThickness: 2,
        website: 'www.google.com',
        // linkedinURL: '',
        tagLine: '',
        twitterHandle: '',
        instagram: '',
        cardColor: Colors.white,
        companyColor: Colors.orange,
        taglineColor: Colors.orange,
        textColor: Colors.orange,
      ),
    );
  }
}
