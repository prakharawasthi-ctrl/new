// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/Screens/IITM_WEB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Screens/profile.dart';
import 'AuthPage.dart';

import 'CreateProfilePage.dart';
import 'profile.dart';

// import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

class mainPage extends StatefulWidget {
  mainPage({Key? key}) : super(key: key);

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
        body:CustomScrollView(
          slivers: [
            SliverList(delegate:  SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Product featuredProduct = storeProvider.products[index];
                return featuredProduct.featured ?)
          ],
        )
        
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Foundational Level Resources",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff792018)),
                )),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  child: const Center(
                    child: Text('Mathmatics 1'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[100],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  child: const Center(
                    child: Text('Statatistics 1'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[200],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[300],
                  child: const Center(
                    child: Text('Computational Thinking'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[300],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[400],
                  child: const Center(
                    child: Text('English 1'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[400],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[500],
                  child: const Center(
                    child: Text('Mathematics 2'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[500],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[600],
                  child: const Center(
                    child: Text('Statistics 2'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[600],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Python'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[700],
                  ),
                ),
             
            // diploma level cources started
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Diploma Level Resources",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff792018)),
                )),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  child: const Center(
                    child: Text('DBMS'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[50],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  child: const Center(
                    child: Text('PDSA'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[100],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[300],
                  child: const Center(
                    child: Text('Modern App Developement 1'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[200],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[400],
                  child: const Center(
                    child: Text('Programming Concepts Using Java'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[300],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[500],
                  child: const Center(
                    child: Text('Modern Application Developement 2'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[400],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[600],
                  child: const Center(
                    child: Text('System Commands'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[500],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Machine Learning Foundation'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[600],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Bussiness Data Management'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[700],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Machine Learning Theory'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[800],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Business Analytics'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue[800],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  height: 50,
                  // color: Colors.amber[700],
                  child: const Center(
                    child: Text('Tools in Data Science'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue[900],
                    
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
