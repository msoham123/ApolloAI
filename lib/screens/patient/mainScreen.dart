
import 'package:flutter/material.dart';
import 'package:login_dash_animation/models/diseaseModel.dart';
import 'package:login_dash_animation/widgets/cards.dart';
import 'package:url_launcher/url_launcher.dart';

import '../mapScreen.dart';


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
            SizedBox(height: 10.0),

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




            SizedBox(height: 30.0),

            Column(
              children: <Widget>[
                Text("What is a disease?")
              ],
            ),


          ],
        ),
      ),
    );

  }




}