import 'package:flutter/material.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
        backgroundColor: Colors.green,

      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,

            color: Color(0xFFF1EFF1),

            child: Row(

              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Recently Viewed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
