import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groupon/authenticate/Signup.dart';
import 'package:groupon/services/auth.dart';



class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({ this.toggleView });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey= GlobalKey<FormState>();
  bool loading = false;

  //text field state

  String email='';
  String password='';
  String error='';
  String forgotPassword='';


  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData(

      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,


        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child:Stack(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.fromLTRB(15.0, 110.0,0.0,0.0),
                    child:Text(
                      'Groupon',
                      style:TextStyle(
                          color: Colors.green,
                          fontSize:80.0,fontWeight:FontWeight.bold,
                          fontFamily: 'Pacifico'),

                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding:EdgeInsets.only(top:35.0,left:20.0,right:20.0),
              child: Form(
                key: _formKey,
                child:Column(
                  children: <Widget>[
                    TextFormField(
                        validator: (val) => val.isEmpty? 'Enter an email': null,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            color:Colors.grey,
                          ),

                        ),

                        onChanged: (val){
                          setState(()
                          => email = val
                          );
                        }
                    ),
                    TextFormField(
                        validator: (val) => val.length<6? 'Enter a password 6+ chars long': null,
                        decoration: InputDecoration(

                          hintText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            color:Colors.grey,
                          ),
                        ),
                        obscureText: true,
                        onChanged: (val){
                          setState(()
                          => password = val
                          );
                        }
                    ),
                    SizedBox(height:20.0,),

                    SizedBox(height:5.0),

                    SizedBox(height:40.0),
                    Container(
                      height:40.0,
                      child:Material(

                        borderRadius:BorderRadius.circular(20.0),
                        shadowColor:Colors.greenAccent,
                        color: Colors.green,
                        elevation:7.0,
                        child:GestureDetector(
                          // not exactly the same as video
                          onTap:() async {
                            if(_formKey.currentState.validate()){
                              setState(() => loading = true);
                              dynamic result= await _auth.signInWithEmailAndPassword(email.trim(), password);
                              if(result== null){

                                setState(() => error = 'Could not sign in with those credentials' );
                                setState(() => forgotPassword = 'Forgot Password? Click here to reset' );
                                loading=false;


                              }

                            }



                          },
                          child:Center(
                            child:Text(

                              'LOGIN',
                              style:TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:20.0),
                  ],
                ),
              ),
            ),
            SizedBox(height:10.0),
            Center(
              child: Text(
                error,
                style: TextStyle(
                    color: Colors.red),

              ),
            ),
            SizedBox(height:10.0),
            Center(
              child: InkWell(

                child: Text(
                  forgotPassword,

                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,),

                ),
              ),
            ),
            SizedBox(height:30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to pallet?',
                  style:TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(width :5.0),


                InkWell(
                  onTap: () {
                    widget.toggleView();
                  },
                  child:Text('Register',
                    style:TextStyle(
                      color:Colors.green,
                      fontFamily:'Montserrat',
                      fontWeight:FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),),
                )

              ],

            )
          ],

        ),

      ),
    );
  }
}




