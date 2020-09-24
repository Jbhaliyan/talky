import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      height: 60,
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16.0);
}

TextStyle mediumTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
}

TextStyle buttonTextStyle(Color colour) {
  return TextStyle(color: colour, fontSize: 17.0);
}
