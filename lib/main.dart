import 'package:flutter/material.dart';
import 'package:groupon/home/HomePage.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:groupon/models/user.dart';
import 'package:groupon/screens/wrapper.dart';
import 'package:groupon/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserID>.value(
      value: AuthService().user,
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: Colors.green
              ),
              primaryTextTheme: TextTheme(
                  body1: TextStyle(
                      color: Colors.black
                  )
              ),
              iconTheme: IconThemeData(
                  color: Colors.green
              ),
              bottomAppBarColor: Colors.green,
              bottomAppBarTheme: BottomAppBarTheme(
                color: Colors.green,

              )
          ),


          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          routes:
          {





          }

      ),
    );
  }
}



