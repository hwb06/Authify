
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtcci/execuitive_members.dart';
import 'package:flutter_gtcci/gtcci.dart';
import 'package:flutter_gtcci/office_bearers.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   return Scaffold(

     body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Color(0xff2af598), Color(0xff009efd),
           ],
         ),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           SizedBox(height: 40),
           Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget> [
                 Image.asset("assets/images/gtcci2.png",
                 width: 100,
                 height: 100,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10, bottom: 51),
                   child: Container(
                     margin: EdgeInsets.only(top: 15),
                     child: Text(
                         "Gujrat Chamber Of Commerce \n and Industry",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 19,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'FontMain',
                         fontStyle: FontStyle.italic,
                         color: Colors.black.withOpacity(0.6),
                       ),
                     ),
                   ),
                 ),

                 //Buttons
                 Container(
                   child: Padding(
                     padding: const EdgeInsets.all(50.0),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
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
                                     MaterialPageRoute(builder: (context) => Gtcci() ),
                                 );
                               },
                               child: Text(
                                 'GTCCI',
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
                                       vertical: 30, horizontal: 75),
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
                                     MaterialPageRoute(builder: (context) => Exe_Members() ),
                                 );
                               },
                               child: Text(
                                 'EXECUITIVE MEMBERS',
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
                                       vertical: 32, horizontal: 20),
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
                                     MaterialPageRoute(builder: (context) => Office_Bearers() ),
                                 );
                               },
                               child: Text(
                                 'OFFICE BEARERS',
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
                                       vertical: 30, horizontal: 40),
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