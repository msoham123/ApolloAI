import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_dash_animation/screens/patient/diseaseScreen.dart';


import '../main.dart';


class diseaseCard extends StatelessWidget {
  String title, medication, treatment, type, symptoms;
  Image picture;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) =>
//            eventScreen(
//              eventName: thisEvent.title,
//              eventDescription: thisEvent.description,
//              eventDate: thisEvent.date,
//              eventLocation: thisEvent.location,
//              eventState: thisEvent.state,
//              eventLink: thisEvent.url,
//              eventImage: thisEvent.picture,
//              DEST: thisEvent.coordinate,
//              localOfficerPositions: thisEvent.localOfficerPositions,
//              localOfficers: thisEvent.localOfficers,
//            )));
//      },
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          diseaseScreen(
            title: "Malaria",
            treatment: "Use a mosquito net",
            medication: "antimalaria",
            symptoms: "Fever, cold, cough, etc.",
            diseaseImage: Image.asset("assets/images/disease.jpg"),
            type: "Viral",
      )));
    },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width/2,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: MediaQuery.of(context).size.height/ 3.25,
                      width: MediaQuery.of(context).size.width /1,
                      image: AssetImage("assets/images/disease.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Disease",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_upward,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Bacterial",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}