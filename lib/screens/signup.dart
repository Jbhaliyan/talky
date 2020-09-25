import 'package:flutter/material.dart';
import 'package:talky/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(top: 250.0),
          height: MediaQuery.of(context).size.height - 100,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: userNameTextEditingController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("username"),
                ),
                TextField(
                  controller: emailTextEditingController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("email"),
                ),
                TextField(
                  controller: passwordTextEditingController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("password"),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text("Forgot Password?", style: mediumTextStyle()),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff00695c),
                        const Color(0xff003d33),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text("Sign Up", style: buttonTextStyle(Colors.white)),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text("Sign Up with Google",
                      style: buttonTextStyle(Colors.black87)),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: mediumTextStyle(),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
