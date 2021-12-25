// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/Screens/CreateProfilePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff792018),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 200,
              child: Image.asset('assets/images/logo.png',
                  height: 150, width: 150),
            ),
            // Padding(padding:const EdgeInsets.only(top: 10)
            // bottom:200,
            Positioned(
              top: 250,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "IIT  Madras",
                  style: TextStyle(
                      color: Color(0xffd5a54e),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Mobi-Notes",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'hindi'),
              ),
            ),

            Positioned(
              bottom: 150,
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffd5a54e)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    // todo add google signin logic
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => CreateProfilePage()));
                  },
                  child: Text("Google sign In"),
                ),
                //
              ),
            ),
            Positioned(
                bottom: 10,
                child: Text("Copyrights Preserved 2021-2022 ",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),

        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
