// import 'dart:html';

// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'AuthPage.dart';
import 'profile.dart';
import 'mainPage.dart';

class CreateProfilePage extends StatefulWidget {
  CreateProfilePage({Key? key}) : super(key: key);

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  TextEditingController _name = TextEditingController();
  var _email;
  TextEditingController _house = TextEditingController();
  TextEditingController _term = TextEditingController();

  final GlobalKey<FormState> createProfileKey = new GlobalKey<FormState>();

  List<String> housetype = <String>[
    "Bandipur",
    "Corbet",
    "Gir",
    "Kanha",
    "Kaziranga",
    "Nallamala",
    "Namdapha",
    "Nilgiri",
    "Pichavaram",
    "Saranda",
    "Sundarbans",
    "Wayanad"
  ];
  List<String> termtype = <String>[
    'Foundation level',
    'Diploma level',
    'Degree level'
  ];
  late String name;
  var selectedTerm, selectedTermType, selectedHouse, selectedHouseType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd5a54e),
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xffd5a54e)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 1.5,
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Form(
            key: createProfileKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: Text(
                    "Full Name:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffd5a54e),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffd5a54e)),
                      ),
                      hintText: "Keen Kumar",
                      // labelText: "Full Name"
                    ),
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "full name is mendatory";
                      }
                      return null;
                    },
                    onSaved: (name) {
                      this.name = name!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Select term:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 80)),
                    SizedBox(width: 30.0),
                    DropdownButton(
                      items: termtype
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (selectedTermType) {
                        print('$selectedTermType');
                        setState(() {
                          selectedTerm = selectedTermType;
                        });
                      },
                      value: selectedTerm,
                      isExpanded: false,
                      hint: Text(
                        'Choose Term Type',
                      ),
                    ),
                  ],
                ),
                // start of second dropdown
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Select House:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 80)),
                    SizedBox(width: 30.0),
                    DropdownButton(
                      items: housetype
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (selectedHouseType) {
                        print('$selectedHouseType');
                        setState(() {
                          selectedHouse = selectedHouseType;
                        });
                      },
                      value: selectedHouse,
                      isExpanded: false,
                      hint: Text(
                        'Choose House',
                      ),
                    ),
                  ],
                ),

                // end of second dreop down

                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffd5a54e)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () async {
                        // todo add google signin logic
                        createProfileKey.currentState!.save();

                        if (createProfileKey.currentState!.validate()) {
                          //
                          FirebaseFirestore firebaseFirestore =
                              await FirebaseFirestore.instance;
                          String? email =
                              FirebaseAuth.instance.currentUser!.email;
                          _email = email;
                          debugPrint("form saved sucessfully");
                          late var uData = {
                            "name": name,
                            "selectedTerm": selectedTerm,
                            "selectedHouse": selectedHouse,
                            "email": email
                          };

                          // FirebaseFirestore firebaseFirestore =
                          //     await FirebaseFirestore.instance;
                          // String? email =
                          //     FirebaseAuth.instance.currentUser!.email;

                          await firebaseFirestore
                              .collection("Users")
                              .doc(email)
                              .set(uData);

                          print("data added");
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (_) => mainPage()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Import(
                                        name: name,
                                        email: "$_email",
                                        house: "$selectedHouse",
                                        term: "$selectedTerm",
                                      )));
                        } else {
                          debugPrint("please fill form for sign in again ");
                        }
                      },
                      child: Text("Register"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
