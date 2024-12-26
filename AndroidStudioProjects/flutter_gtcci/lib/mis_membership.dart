import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtcci/mis_login.dart';
import 'package:flutter_gtcci/mis_subscriptions.dart';

class MISMembership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff2af598),
            Color(0xff009efd),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/gtcci2.png",
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      ""
                      "Gujrat Chamber Of Commerce \n and Industry",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'FontMain',
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 51),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2af598), Color(0xff009efd),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button tap
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MISLogin()),

                                  );
                                },
                                child: Text(
                                  'MIS Login',
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.green),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        vertical: 25, horizontal: 60),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 16),
                                  ),
                                  elevation: MaterialStateProperty.all<double>(5),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2af598), Color(0xff009efd),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white, spreadRadius: 3, blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button tap
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => MISSubscriptions()),
                                  );
                                },
                                child: Text(
                                  'MIS SUBSCRIPTION',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.green),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        vertical: 28, horizontal: 30),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 16),
                                  ),
                                  elevation: MaterialStateProperty.all<double>(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),




                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
