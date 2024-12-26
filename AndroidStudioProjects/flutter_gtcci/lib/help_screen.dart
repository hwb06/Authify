
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtcci/about_pg.dart';
import 'package:flutter_gtcci/event_screen.dart';
import 'package:flutter_gtcci/main.dart';
import 'package:flutter_gtcci/media_screen.dart';
import 'package:flutter_gtcci/mis_membership.dart';
import 'package:flutter_gtcci/mou_screen.dart';
import 'package:flutter_gtcci/social_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpSceen extends StatelessWidget {
  
  int _selected = 0;
  void changeSelected(int index) {
    setState (() {
      _selected = index;
    });
    
  }

  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse("https://gtcci.org.pk/landingpage/help/"));

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
        title: Text("Help", style: TextStyle(fontWeight: FontWeight.bold ),
            ),
        titleSpacing: 00.0,
      ),

      body:  WebViewWidget(
        controller: controller,
      ),

      drawer: Container(
        width: 280,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 210,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/grad_green.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image(
                                image: AssetImage('assets/images/gtcci2.png'),
                                height: 64,
                              ),
                            ),
                          ),
                          Text(
                            "Gujrat Chamber of Commerce and Industry",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1,
                              fontFamily: 'FontMain',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Developed By SIT Digital",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green,
                                  height: 2,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  selected: _selected == 0,
                  leading: Icon(
                    Icons.home,
                    color: Colors.grey.shade600,
                    size: 25,
                  ),
                  title: Text(
                    "HOME",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain3',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(title: 'Home')),
                    );
                    changeSelected(0);
                  },
                ),
              ),
              ListTile(
                selected: _selected == 1,
                leading: Icon(
                  Icons.people_alt,
                  color: Colors.grey.shade600,
                  size: 22,
                ),
                title: Text(
                  "ABOUT",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FontMain3",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                  changeSelected(1);
                },
              ),
              ListTile(
                selected: _selected == 2,
                leading: Icon(
                  Icons.perm_media,
                  color: Colors.grey.shade600,
                  size: 22,
                ),
                title: Text(
                  "MEDIA",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FontMain3",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediaScreen()),
                  );
                  changeSelected(2);
                },
              ),
              ListTile(
                  selected: _selected == 3,
                  leading: Icon(
                    Icons.event,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text(
                    "EVENTS",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontFamily: "FontMain3",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen() ),
                    );
                    changeSelected(3);
                  },
                ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff2af598), Color(0xff009efd),
                        ]
                    )
                ),
                child: ListTile(
                  selected: _selected == 4,
                  leading: Icon(
                    Icons.help,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text(
                    "HELP",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontFamily: "FontMain3",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpSceen()),
                    );
                    changeSelected(4);
                  },
                ),
              ),
              ListTile(
                selected: _selected == 5,
                leading: Icon(
                  Icons.note_alt,
                  color: Colors.grey.shade600,
                  size: 22,
                ),
                title: Text(
                  "MOU",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FontMain3",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MOUScreen() ),
                  );
                  changeSelected(5);
                },
              ),
              ListTile(
                selected: _selected == 6,
                leading: Icon(
                  Icons.attractions,
                  color: Colors.grey.shade600,
                  size: 22,
                ),
                title: Text(
                  "SOCIAL",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FontMain3",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SocialScreen() ),
                  );
                  changeSelected(6);
                },
              ),
              ListTile(
                selected: _selected == 7,
                leading: Icon(
                  Icons.person_add,
                  color: Colors.grey.shade600,
                  size: 22,
                ),
                title: Text(
                  "MIS(Only For Members)",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FontMain3",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MISMembership() ),
                  );
                  changeSelected(7);
                },
              ),
            ],
          ),
        ),
      ),




    );

  }

  void setState(Null Function() param0) {}

}