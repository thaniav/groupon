import 'package:flutter/material.dart';
import 'package:groupon/models/uid.dart';
import 'package:groupon/models/user.dart';
import 'package:groupon/services/auth.dart';
import 'package:groupon/services/database.dart';
import 'package:groupon/widgets/settingWidget.dart';

class MyStuff extends StatefulWidget {
  @override
  _MyStuffState createState() => _MyStuffState();
}

class _MyStuffState extends State<MyStuff> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
StreamBuilder<UserData>(
  stream: DatabaseService(uid: current_user_uid).userData,
  builder: (context, snapshot) {
    UserData userData= snapshot.data;
    if (snapshot.hasData) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8.0),
              child: Text(userData.name, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),),
            ),
           Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Text(userData.emailID),
           ),

          ],
        ),
      );

  }
    else{
      return Container();
    }
  }

),
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
height: 50.0,

                color: Color(0xFFF1EFF1),

                child: Row(

                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('My Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),
                  ],
                ),
              ),


              MySetting(name: "Background Location", icon: Icons.my_location,),
              MySetting(name: "Payment Methods", icon: Icons.credit_card,),
              MySetting(name: "Shipping Addresses", icon: Icons.airport_shuttle,),
              MySetting(name: "Change Password", icon: Icons.vpn_key),
              MySetting(name: "Customer Support", icon: Icons.help_outline),
              MySetting(name: "Sell on Groupon", icon: Icons.domain),
              MySetting(name: "Accessibility", icon: Icons.touch_app),
              MySetting(name: "About Groupon", icon: Icons.star),

              Column(
                  children: <Widget> [
                    InkWell(
                      onTap: ()async{
                        await _auth.signOut();
                      },
                      child: Container(
                        height: 50.0,
                        child: Row(

                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.exit_to_app),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("Sign Out", style: TextStyle( fontSize: 16.0),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ]
              ),


            ],
          )



        ],
      ),
    );
  }
}

