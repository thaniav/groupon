import 'package:flutter/material.dart';
import 'package:groupon/screens/Categories.dart';
import 'package:groupon/screens/Featured.dart';
import 'package:groupon/screens/MyStuff.dart';
import 'package:groupon/screens/Notifications.dart';
import 'package:groupon/screens/Saved.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;
  final tabs=[
    Featured(),
Categories(),
  Notifications(),
    Saved(),
    MyStuff()
  ];
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
        title: Text("Featured"
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.view_comfy,),
              title: Text("Categories"
              ),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notifications"
              ),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Saved"
              ),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("My Stuff"
              ),

            ),
          ],
          onTap: (i){
            setState(() {
              _currentIndex=i;
            });
          },
        ),
      ),
    );
  }
}
