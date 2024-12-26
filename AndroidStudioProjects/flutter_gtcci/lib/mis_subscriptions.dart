

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MISSubscriptions extends StatelessWidget {

  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse("https://forms.office.com/Pages/ResponsePage.aspx?id=ako2arhDXkWK0Ac4VlsDu0ggJGQ8pW5ArchbBE2m2EBUMEJVSVJXN0NZUzVPMzA5N0ZLU1pESFMyTC4u"));

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,

        backgroundColor: Color(0xff2af598),
        title: Text("MIS Subscription", style: TextStyle(fontWeight: FontWeight.bold ),
        ),
        titleSpacing: 00.0,
      ),

      body:  WebViewWidget(
        controller: controller,
      )

    );
  }
}