import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_dash_animation/screens/mapScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login_dash_animation/main.dart';
import 'package:login_dash_animation/screens/patient/navigation.dart';


class diseaseScreen extends StatefulWidget {
  String title, medication, treatment, type, symptoms, description;
  Image diseaseImage;

  diseaseScreen({
    @required this.medication,
    @required this.treatment,
    @required this.type,
    @required this.symptoms,
    @required this.diseaseImage,
    @required this.title,
    @required this.description
  });

  @override
  _diseaseScreenState createState() => _diseaseScreenState(
    diseaseImage: diseaseImage,
    medication: medication,
    treatment: treatment,
    type: type,
    symptoms: symptoms,
    title: title,
    description : description,
  );
}



class _diseaseScreenState extends State<diseaseScreen> {
  String title, medication, treatment, type, symptoms, description;
  Image diseaseImage;

  _diseaseScreenState({
    @required this.medication,
    @required this.treatment,
    @required this.type,
    @required this.symptoms,
    @required this.diseaseImage,
    @required this.title,
    @required this.description
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//        uid = loggedInUser.uid;
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  void _launch(String link) async {
    String url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  

  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*1.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Positioned(
                child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: diseaseImage),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    right: MediaQuery.of(context).size.width / 15,
                    top: MediaQuery.of(context).size.height / 20),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Spacer(),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width /
                                10),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Text(
                          ("Symptoms : $symptoms"),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: GestureDetector(
                          onTap: (){
                            _launch(medication);
                          },
                          child: Text(
                            ("$medication"),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),

                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Text(
                          ("Treatment : $treatment"),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Text(
                          ("Type : $type"),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              MyApp.currentIndex = 1;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavScreen(),
                                  ));
                            },
                            child: Container(
                              height:
                              MediaQuery.of(context).size.height /
                                  15,
                              width:
                              MediaQuery.of(context).size.width /
                                  2.5,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.map,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Find Clinic',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 25,
                      ),
                      Container(
                        child: null,
                      ),
                    ],
                  ),
                ),
              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height,
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.width,
//                child: Container(color: Colors.red),
//              ),
            ],
          ),
        ),
      );
  }
}
