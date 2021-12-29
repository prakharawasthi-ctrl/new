import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IITM_WEB extends StatefulWidget {
  IITM_WEB({Key? key}) : super(key: key);

  @override
  _IITM_WEBState createState() => _IITM_WEBState();
}

class _IITM_WEBState extends State<IITM_WEB> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IITM DASHBOARD",
          style: TextStyle(color: Color(0xff792018)),
        ),
        backgroundColor: Color(0xffd5a54e),
      ),
      body: WebView(
        userAgent: "random",
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            "https://app.onlinedegree.iitm.ac.in/student_dashboard/latest_updates",
      ),
    );
  }
}
