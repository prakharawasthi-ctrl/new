// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/CreateProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mainPage.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = new GoogleSignIn();
  late GoogleSignInAccount signedAccount;
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
                  onPressed: () async {
                    await googleSignIn.signOut();
                    try {
                      signedAccount = (await googleSignIn.signIn())!;
                      if (signedAccount != null) {
                        debugPrint("Authentication sucessful");
                        print('signed in from ${signedAccount.email}');

                        GoogleSignInAuthentication gauth =
                            await signedAccount.authentication;
                        final AuthCredential credential =
                            GoogleAuthProvider.credential(
                          accessToken: gauth.accessToken,
                          idToken: gauth.idToken,
                        );
                        UserCredential login =
                            await auth.signInWithCredential(credential);

                        if (login.user != null) {
                          // TODO : query the user with firebase and we have to check if profile exists in user collection
                          // if yes I have to route to product catelog page
                          // else route to create profile page

                          // Query

                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await firestore
                              .collection("Users")
                              .where('email',
                                  isEqualTo: auth.currentUser!.email)
                              .get()
                              .then((value) {
                            debugPrint(
                                "docs length" + value.docs.length.toString());
                            if (signedAccount.email
                                .contains("@student.onlinedegree.iitm.ac.in")) {
                              if (value.docs.isEmpty) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CreateProfilePage(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => mainPage()));
                              }
                            } else {
                              return showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!

                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Alert!'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text(
                                              'Please login through your iitm email id '),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }).onError((error, stackTrace) {});
                        }
                      } else {
                        await googleSignIn.signOut();
                        await auth.signOut();
                      }
                    } catch (error) {
                      print(error);
                    }
                    ;

                    signedAccount = (await googleSignIn.signIn())!;
                    if (signedAccount != null) {
                      debugPrint("Authentication sucessful");
                    } else {
                      debugPrint("Authentication failed");
                    }
                    // todo add google signin logic
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
