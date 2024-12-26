import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtcci/main.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 4), () {

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Dashboard",), ));
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/gtcci2.png', height: 170),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 120),
                    child: Text("Gujrat Chamber of Commerce \n and Industry", textAlign: TextAlign.center , style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'FontMain',
                      fontStyle: FontStyle.italic,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    ),
                  ),

                  CircularProgressIndicator(),
                ],
              ),
            )
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2af598), Color(0xff009efd),
            ],
          )
        ),
      ),
    );

  }
}