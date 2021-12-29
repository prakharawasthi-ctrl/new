// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/Screens/IITM_WEB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Screens/profile.dart';
import 'package:myapp/Subjects/Degree.dart';
import 'package:myapp/Subjects/Foundational.dart';
import 'package:myapp/Subjects/diploma.dart';
import 'AuthPage.dart';

import 'CreateProfilePage.dart';
import 'profile.dart';

// import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';
late String name, email, house, term;

class mainPage extends StatefulWidget {
  mainPage({Key? key, String}) : super(key: key);

  @override
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff792018),
        title: Text(
          "Resources",
          style: TextStyle(
            color: Color(0xffd5a54e),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IITM_WEB(),
                ),
              );
            },
            icon: Icon(Icons.school),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 150,
                child: const Center(
                  child: Text(
                    'Foundational Level',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[100],
                  image: const DecorationImage(
                      image: AssetImage("assets/images/foundation.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Foundational(),
                  ),
                ),
              }, //this part is for navigation
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            GestureDetector(
              child: Container(
                height: 150,
                // color: Colors.amber[300],
                child: const Center(
                  child: Text(
                    'Diploma Level',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[200],
                  image: const DecorationImage(
                      image: AssetImage("assets/images/diploma.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => diploma(),
                  ),
                ),
              }, //this part is for navigation
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            GestureDetector(
              child: Container(
                height: 150,
                // color: Colors.amber[400],
                child: const Center(
                  child: Text(
                    'Degree Level',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[300],
                  image: const DecorationImage(
                      image: AssetImage("assets/images/degree.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Degree(),
                  ),
                ),
              }, //this part is for navigation
            ),
          ],
        ),
      ),
    );
  }
}
