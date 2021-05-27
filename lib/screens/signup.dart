import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:talky/screens/signin.dart';
import 'package:talky/services/auth.dart';
import 'package:talky/services/database.dart';
import 'package:talky/widgets/widgets.dart';

import 'chatRoom.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  AuthClass authClass = AuthClass();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signMeUp() async {
    try {
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _pwdController.text);
      // userCredential.user.displayName = _userNameController.text;
      print(userCredential.user.uid);
      setState(() {
        isLoading = false;
      });
      Map<String, String> userMap = {
        "name": _userNameController.text,
        "email": _emailController.text
      };
      databaseMethods.uploadUserInfo(userMap);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => ChatRoom()),
          (route) => false);
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    }
  }

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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty || val.length < 2
                              ? "Please provide Username"
                              : null;
                        },
                        controller: _userNameController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("username.."),
                      ),
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "Invalid email";
                        },
                        controller: _emailController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("email.."),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.length < 8
                              ? "Use minimum 8 characters"
                              : null;
                        },
                        controller: _pwdController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("password.."),
                      ),
                    ],
                  ),
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
                GestureDetector(
                  onTap: () {
                    signMeUp();
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Color(0xff00735c),
                        )
                      : button(context, "Sign Up"),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                    onTap: () async {
                      await authClass.googleSignIn(context);
                    },
                    child: googleButton(context)),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: mediumTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (builder) => SignIn()),
                            (route) => false);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                        ),
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
