import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Authify/screens/signin_screen.dart';

class ThemeToggleScreen extends StatefulWidget {
  @override
  _ThemeToggleScreenState createState() => _ThemeToggleScreenState();
}

class _ThemeToggleScreenState extends State<ThemeToggleScreen> {
  bool _isDarkMode = false; // Initial theme mode

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; // Toggle between dark and light mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Authify'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: _toggleTheme, // Button to toggle theme
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              'Current Mode: ${_isDarkMode ? "Dark" : "Light"}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20), // Spacing from the bottom
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => SigninScreen());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 52), // Button size
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
    );
  }
}
