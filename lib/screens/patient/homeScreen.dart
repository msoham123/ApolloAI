import 'package:flutter/material.dart';
import 'package:login_dash_animation/animations/fadeAnimation.dart';
import 'package:login_dash_animation/components/customButton.dart';
import 'package:login_dash_animation/components/customButtonAnimation.dart';
import 'package:login_dash_animation/screens/patient/loginScreen.dart';
import 'package:login_dash_animation/screens/patient/signUpScreen.dart';

import '../doctor/homeScreenDoctor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/doctorPhone.png", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  FadeAnimation(2.4,Text("We're here for you.", style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2
                ))),
                FadeAnimation(2.6,Text("ApolloAI", style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ))),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(2.8,CustomButtonAnimation(
                      label: "Sign up",
                      backbround: Colors.transparent,
                      fontColor: Colors.white,
                      borderColor: Colors.white,
                      child: SignUpScreen(),
                    )),
                    SizedBox(height: 20),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Sign In",
                      backbround: Colors.white,
                      borderColor: Colors.white,
                      fontColor: Color(0xFFF001117),
                      child: LoginScreen(),
                    )),
                    SizedBox(height: 30),
                    FadeAnimation(3.4,CustomButtonAnimation(
                      label : "I am a Doctor",
                      backbround: Colors.transparent,
                      borderColor: Colors.transparent,
                      fontColor : Colors.white,
                      child: HomeScreenDoctor(),
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}