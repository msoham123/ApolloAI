import 'package:flutter/material.dart';
import 'package:login_dash_animation/components/buttonLoginAnimation.dart';
import 'package:login_dash_animation/components/customTextfield.dart';
import 'package:login_dash_animation/screens/dashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_dash_animation/screens/doctor/navigationDoctor.dart';

class LoginScreenDoctor extends StatefulWidget {
  @override
  _LoginScreenDoctorState createState() => _LoginScreenDoctorState();
}

class _LoginScreenDoctorState extends State<LoginScreenDoctor> {
  final _auth = FirebaseAuth.instance;
  String email = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/doctorTools.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter
              )
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.black,size:32),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                    height: MediaQuery.of(context).size.height * 0.70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome back, doctor",style: TextStyle(
                          color: Color(0xFFF032f42),
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        )),
                        Text("Sign to continue",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                        )),
                        SizedBox(height: 40),
                        TextField(
                          onChanged: (value) {
                            email = value;
                            print(email);
                          },
                          style: TextStyle(
                              color: Color(0xFFF234253),
                              fontWeight: FontWeight.bold),
                          obscureText: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: Color(0xFFF234253),
                                fontWeight: FontWeight.bold),
                            suffixIcon: Icon(
                              Icons.email,
                              size: 27,
                              color: Color(0xFFF032f41),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            password = value;
                            print(password);
                          },
                          style: TextStyle(
                              color: Color(0xFFF234253),
                              fontWeight: FontWeight.bold),
                          obscureText: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Color(0xFFF234253),
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(
                              Icons.https,
                              size: 27,
                              color: Color(0xFFF032f41),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: MaterialButton(
                            onPressed: () async {
                              try {
                                final result =
                                await _auth.signInWithEmailAndPassword(
                                    email: email,
                                    password: password);
                                FirebaseUser user = result.user;

                                if (result != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavScreenDoctor(),
                                    ),
                                  );
                                } else {
                                  print(result);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(
                              "Sign in",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}