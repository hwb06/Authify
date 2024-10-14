import 'package:flutter/material.dart';

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
        title: Text('Light/Dark Mode Example'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: _toggleTheme, // Button to toggle theme
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Current Mode: ${_isDarkMode ? "Dark" : "Light"}',
          style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: _isDarkMode ? Colors.black : Colors.white, // Background color change
    );
  }
}
