import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:login_dash_animation/screens/doctor/navigationDoctor.dart';
import 'package:login_dash_animation/screens/patient/homeScreen.dart';
import 'package:login_dash_animation/screens/patient/navigation.dart';

import 'screens/patient/homeScreen.dart';

//Device Preview
//void main() => runApp(DevicePreview(builder: (context) => MyApp()));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static int currentIndex = 0;
  static String email = '';
  static String password = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
      //activate for device preview
      debugShowCheckedModeBanner: false,
      title: 'Surfing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavScreenDoctor(),
    );
  }
}

