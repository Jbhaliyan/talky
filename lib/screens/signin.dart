import 'package:flutter/material.dart';

import 'package:talky/screens/signup.dart';
import 'package:talky/services/auth.dart';
import 'package:talky/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'chatRoom.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  AuthClass authClass = AuthClass();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  bool isLoading = false;

  signIn() async {
    try {
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _pwdController.text);
      // userCredential.user.displayName = _userNameController.text;
      print(userCredential.user.email);
      setState(() {
        isLoading = false;
      });
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
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              // padding: EdgeInsets.only(top: 250.0),
              height: MediaQuery.of(context).size.height - 100,
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _pwdController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("password"),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("Forgot Password?",
                              style: mediumTextStyle()),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                        onTap: () {
                          signIn();
                        },
                        child: button(context, "Sign In")),
                    SizedBox(height: 10.0),
                    GestureDetector(
                        onTap: () async {
                          await authClass.googleSignIn(context);
                        },
                        child: googleButton(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: mediumTextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => SignUp()),
                                (route) => false);
                          },
                          child: Text(
                            "Register now",
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
    );
  }
}
