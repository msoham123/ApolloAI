import 'package:flutter/material.dart';
import 'package:login_dash_animation/animations/fadeAnimation.dart';
import 'package:login_dash_animation/components/customButton.dart';
import 'package:login_dash_animation/components/customButtonAnimation.dart';
import 'package:login_dash_animation/screens/patient/homeScreen.dart';
import 'package:login_dash_animation/screens/patient/loginScreen.dart';
import 'package:login_dash_animation/screens/doctor/signUpScreenDoctor.dart';

import 'loginScreenDoctor.dart';

class HomeScreenDoctor extends StatefulWidget {
  @override
  _HomeScreenDoctorState createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/doctorWorking.png", fit: BoxFit.cover),
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
                  FadeAnimation(2.4,Text("Thank you for your hard work.", style: TextStyle(
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
                      child: SignUpScreenDoctor(),
                    )),
                    SizedBox(height: 20),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Sign In",
                      backbround: Colors.white,
                      borderColor: Colors.white,
                      fontColor: Color(0xFFF001117),
                      child: LoginScreenDoctor(),
                    )),
                    SizedBox(height: 30),
                    FadeAnimation(3.4,CustomButtonAnimation(
                      label : "I am a patient",
                      backbround: Colors.transparent,
                      borderColor: Colors.transparent,
                      fontColor : Colors.white,
                      child: HomeScreen(),
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