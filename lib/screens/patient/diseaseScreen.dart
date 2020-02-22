import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class diseaseScreen extends StatefulWidget {
  String eventName,
      eventDescription,
      eventDate,
      eventLocation,
      eventState,
      eventLink;
  Image eventImage;
  var localOfficers = [];
  var localOfficerPositions = [];

  diseaseScreen({
    @required this.eventName,
    @required this.eventDescription,
    @required this.eventDate,
    @required this.eventLocation,
    @required this.eventState,
    @required this.eventLink,
    @required this.eventImage,
    @required this.localOfficers,
    @required this.localOfficerPositions,
  });

  @override
  _diseaseScreenState createState() => _diseaseScreenState(
    eventDate: eventDate,
    eventDescription: eventDescription,
    eventImage: eventImage,
    eventLink: eventLink,
    eventName: eventName,
    eventLocation: eventLocation,
    eventState: eventState,
    localOfficerPositions : localOfficerPositions,
    localOfficers : localOfficers,
  );
}



class _diseaseScreenState extends State<diseaseScreen> {
  String eventName,
      eventDescription,
      eventDate,
      eventLocation,
      eventState,
      eventLink;
  Image eventImage;
  var localOfficers = [];
  var localOfficerPositions = [];


  String uid = '';
  
  _diseaseScreenState({
    @required this.eventName,
    @required this.eventDescription,
    @required this.eventDate,
    @required this.eventLocation,
    @required this.eventState,
    @required this.eventLink,
    @required this.eventImage,
    @required this.localOfficers,
    @required this.localOfficerPositions,
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

//  void _launch(String link) async {
//    String url = link;
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
  

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
                    child: Image.asset("assets/images/doctorWorking.png")),
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
                          color: Colors.black,
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
                          eventName,
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
                          eventDescription,
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
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Date : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                            Text(
                              eventDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Location : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                            Text(
                              eventLocation,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "State : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                            Text(
                              eventState,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                            MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width /
                                10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Website : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'),
                            ),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Text(
                                "Link",
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ],
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.launch,
                                      color: Colors.white,
                                    ),
                                  ),
                                    Text(
                                      'Sign Up',
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
                          GestureDetector(
                            onTap: () {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => myMapScreen(DEST: DEST,title: eventName, startLat: 37.368832, startLong: -122.036346))
//                              );
                            },
                            child: Container(
                              height:
                              MediaQuery.of(context).size.height /
                                  15,
                              width:
                              MediaQuery.of(context).size.width /
                                  2.5,
                              decoration: BoxDecoration(
                                color: Colors.blue,
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
                                    'View On Map',
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
