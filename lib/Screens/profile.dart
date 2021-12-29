import 'AuthPage.dart';

import 'package:flutter/material.dart';

import 'CreateProfilePage.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 20, left: 80, right: 80),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff792018))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateProfilePage(),
              ),
            );
          },
          child: Text("edit profile", style: TextStyle(color: Colors.white)),
        ),
      )),
    );
  }
}

class Import extends StatelessWidget {
  late String name, email, house, term;
  Import(
      {required this.name,
      required this.email,
      required this.house,
      required this.term});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Name:${name}"),
          Text("Email:${email}"),
          Text("House:${house}"),
          Text("Term:${term}")
        ],
      ),
    );
  }
}
