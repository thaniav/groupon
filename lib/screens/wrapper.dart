import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groupon/home/HomePage.dart';
import 'package:groupon/models/user.dart';
import 'package:groupon/screens/Featured.dart';
import 'package:groupon/screens/authenticate/authenticate.dart';


import 'package:provider/provider.dart';


class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool verified;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);

    if(user==null){


      return Authenticate();

    }
    else{
      return HomePage();
    }



  }
}
