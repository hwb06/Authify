import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Authify/screens/signin_screen.dart';

class WelcomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: ()  {
            Get.offAll(() => SigninScreen());
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(150,52),
          ),
          child: const Text('Login', style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  }

}