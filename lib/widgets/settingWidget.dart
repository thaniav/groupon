import 'package:flutter/material.dart';
class MySetting extends StatelessWidget {
  final String name;
  final IconData icon;
  MySetting({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget> [
          Container(
            height: 50.0,
            child: Row(

              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(icon),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(name, style: TextStyle( fontSize: 16.0),),
                ),
              ],
            ),
          ),
          Divider(),
        ]
    );
  }
}
