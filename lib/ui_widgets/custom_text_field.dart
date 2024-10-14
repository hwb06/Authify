import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final RxBool? isPasswordVisible;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.isPasswordVisible,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon: isPasswordVisible != null
            ? GestureDetector(
          onTap: () {
            isPasswordVisible!.toggle(); // Toggle password visibility
          },
          child: Icon(
            isPasswordVisible!.value ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        )
            : null,
        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
