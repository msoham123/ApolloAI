import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_dash_animation/screens/mapScreen.dart';
import 'package:login_dash_animation/screens/patient/chatBotScreen.dart';


import '../../main.dart';
import 'mainScreen.dart';



class NavScreen extends StatefulWidget {


  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  PageController pageController;



  @override
  initState() {
    super.initState();
    pageController = new PageController(
        initialPage: MyApp.currentIndex, keepPage: true, viewportFraction: 1);
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApolloAI"),
    backgroundColor: Colors.orange,
    automaticallyImplyLeading: false,
    ),
      body: Center(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              MyApp.currentIndex = index;
            });
          },
          children: <Widget>[
            MainScreen(),
            MapScreen(),
            myChatBotScreen(),
            MainScreen(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: MyApp.currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          setState(() {
            MyApp.currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.location_on),
            title: Text(
              'Clinics',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Chatbot'),
            activeColor: Colors.orangeAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
