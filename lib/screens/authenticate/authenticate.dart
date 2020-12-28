import 'package:flutter/material.dart';

import 'package:groupon/screens/authenticate/Signin.dart';
import 'package:groupon/screens/authenticate/SignUp.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPage(toggleView: toggleView);
    }
    else{
      return SignUpPage(toggleView: toggleView);
    }
  }
}

