import 'package:flutter/material.dart';

// import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text(
          "Resources",
          style: TextStyle(color: Color(0xff792018)),
        ),
        centerTitle: true,
      ),
    );
  }
}
