
import 'package:flutter/material.dart';
import 'package:login_dash_animation/models/diseaseModel.dart';
import 'package:login_dash_animation/widgets/cards.dart';
import 'package:url_launcher/url_launcher.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  final TextEditingController _searchControl = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 1.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Common Diseases",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "(${DiseaseBase.diseaseList.length})",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return null;
//                        },
//                      ),
//                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: DiseaseBase.diseaseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return diseaseCard(
                    DiseaseBase.diseaseList[index]
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Find a Clinic Near Me",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            FlatButton(
              child: Text(
                "See all (9)",
                style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return MapScreen();
                        },
                      ),
                    );
              },
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/doctorPhone",
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.height/6,
                            fit: BoxFit.cover,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.2, 0.7],
                                colors: [
                                  Colors.orange,
                                  Colors.blue
                                ],
                                // stops: [0.0, 0.1],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.height/6,
                          ),


                          Center(

                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                              padding: EdgeInsets.all(1),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  "Doctor",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


            SizedBox(height: 30.0),


          ],
        ),
      ),
    );

  }




}