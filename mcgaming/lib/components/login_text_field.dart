// ignore: file_names
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: const Color(0xff362447),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Color(0xffAD94C7),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        style: const TextStyle(
          color: Color(0xffAD94C7),
        ),
      ),
    );
  }
}
