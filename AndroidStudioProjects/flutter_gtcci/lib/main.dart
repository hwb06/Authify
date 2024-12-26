import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gtcci/about_pg.dart';
import 'package:flutter_gtcci/event_screen.dart';
import 'package:flutter_gtcci/help_screen.dart';
import 'package:flutter_gtcci/mis_membership.dart';
import 'package:flutter_gtcci/media_screen.dart';
import 'package:flutter_gtcci/mou_screen.dart';
import 'package:flutter_gtcci/social_screen.dart';
import 'package:flutter_gtcci/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GTCCI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //
      //   title: Text("GTCCI"),
      // ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2af598),
              Color(0xff009efd),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              // Optional, agar aap spacing dena chahte hain
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/gtcci2.png',
                      // Apne image ke path ko yahan par de
                      width: 80, // Apne image ka width yahan par set karein
                      height: 80, // Apne image ka height yahan par set karein
                    ),
                    SizedBox(height: 10),
                    // Optional, agar aap spacing dena chahte hain
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Gujrat Chamber Of Commerce \n and Industry',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 160, left: 4),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/vp.png',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Vice President \n Mr. Masoom Qamar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 0),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/p.png',
                                width: 160,
                                height: 170,
                              ),
                              Text(
                                'President \n Mr. Sikandar Ishfaq',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 0),
                        Container(
                          margin: EdgeInsets.only(bottom: 130),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/svp.png',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 7),
                              Container(
                                margin: EdgeInsets.only(bottom: 11),
                                child: Text(
                                  'Senior Vice President \n Mr. Asad Bhatti',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => AboutScreen() ),
                              );
                            },
                            child: Text(
                              'ABOUT',
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
                                    vertical: 17, horizontal: 43),
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




                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MediaScreen() ),
                              );
                            },
                            child: Text(
                              'MEDIA',
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
                                    vertical: 17, horizontal: 45),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => EventScreen() ),
                                );
                              },
                              child: Text(
                                'EVENTS',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 17, horizontal: 40),
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
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HelpSceen() ),
                                );
                              },
                              child: Text(
                                'HELP',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 17, horizontal: 49),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button tap
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MOUScreen() ),
                              );
                            },
                            child: Text(
                              'MOU',
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
                                    vertical: 17, horizontal: 55),
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
                          SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button tap
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SocialScreen() ),

                              );

                            },
                            child: Text(
                              'SOCIAL',
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
                                    vertical: 17, horizontal: 40),
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
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button tap
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MISMembership() ),
                          );
                        },
                        child: Text(
                          'MIS (ONLY FOR MEMBERSHIPS)',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    // Optional spacing
// Container containing images and their descriptions

// Repeat the above structure for other rows of buttons and content

                    // Optional spacing between the content and buttons
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
