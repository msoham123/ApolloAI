import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

import '../main.dart';

class MapScreen extends StatefulWidget {
  @override
  MapState createState() =>
      MapState();
}

class MapState extends State<MapScreen> {
  PageController _pageController;
  LatLng SOURCE = LatLng(0,0);
  Completer<WebViewController> _controller = Completer<WebViewController>();



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _getSource();
  }


  Future<void> _getSource() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    LatLng myLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    print('mylocation = ${myLocation.latitude}, ${myLocation.longitude}');
    SOURCE = myLocation;

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

//  Completer<WebViewController> _controller = Completer<WebViewController>();
//  37.3921529, -122.0483755
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
              javascriptMode: JavascriptMode.unrestricted,
//              initialUrl: "https://www.google.com/maps/search/+clinics+near+me/@${SOURCE.latitude},${SOURCE.longitude},13.44z",
              initialUrl: "https://www.google.com/maps/search/+clinics+near+me/@37.3921529,-122.0483755,13.44z",
              gestureNavigationEnabled: true,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer()..onUpdate = (_) {},
                ),
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
//      body: Stack(
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.arrow_back_ios),
//                color: Colors.white,
//                onPressed: (){
//                  Navigator.pop(context);
//                },
//              ),
//            ],
//          ),
//
//          Positioned(
//            bottom: 100,
//            child: WebView(
//              initialUrl: "https://www.google.com/maps/search/+clinics+near+me/@${SOURCE.latitude},${SOURCE.longitude},13.44z",
//              gestureNavigationEnabled: true,
//              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
//                Factory<VerticalDragGestureRecognizer>(
//                      () => VerticalDragGestureRecognizer()..onUpdate = (_) {},
//                ),
//              },
//              onWebViewCreated: (WebViewController webViewController) {
//                _controller.complete(webViewController);
//              },
//            ),
//          ),
//
//        ],
//      )
    );
  }
}
