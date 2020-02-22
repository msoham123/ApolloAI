
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SettingScreen extends StatefulWidget {
  @override
  SettingState createState() =>
      SettingState();
}

class SettingState extends State<SettingScreen> {
  PageController _pageController;




  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }



  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Sign out of My Account"),
          color: Colors.red,
          onPressed: (){

          },
        ),
      ),
    );
  }
}
