import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/screens/search.dart';

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

Widget googleButton(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(width: 20),
        SvgPicture.asset("assets/images/google.svg", height: 25, width: 25),
        SizedBox(width: 15.0),
        Text(
          "Continue with Google",
          style: buttonTextStyle(Colors.black87),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget button(context, String text) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          // const Color(0xff00735c),
          const Color(0xff00695c),
          const Color(0xff003d33),
        ],
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Text(
      text,
      style: buttonTextStyle(Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget searchList() {
//   return ListView.builder(
//     itemBuilder: (BuildContext context, int index) {
//       return SearchTile(userName: "", userEmail: "");
//     },
//   );
// }
