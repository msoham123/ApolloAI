import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:login_dash_animation/screens/homeScreen.dart';

//Device Preview
void main() => runApp(DevicePreview(builder: (context) => MyApp()));

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      //activate for device preview
      debugShowCheckedModeBanner: false,
      title: 'Surfing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

