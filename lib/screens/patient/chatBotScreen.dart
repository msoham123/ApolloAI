import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

FirebaseUser loggedInUser;
String name = 'John Smith';
final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;

class myChatBotScreen extends StatefulWidget {
  myChatBotScreen({Key key, this.title}) : super(key: key);

  final String title;

  State<StatefulWidget> createState() => myChatBotState();
}

class myChatBotState extends State<myChatBotScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController =  TextEditingController();

//  DatabaseService ds = new DatabaseService();
//  DocumentSnapshot userSnapshot;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
//    _populateCurrentUser(loggedInUser);
    _messages.add(
        ChatMessage(
            text: "Hi, how can I assist you today?",
            name: "Apollo",
            type: false
        )
    );
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

//  void _populateCurrentUser(FirebaseUser user) async {
//    final FirebaseUser user = await _auth.currentUser();
//    final String userUID = user.uid.toString();
//    if(user != null) {
//      userSnapshot = await ds.getUser(userUID);
//    }
//    name = userSnapshot.data['full_name'].toString();
//    print(name);
//  }

  Widget _buildTextComposer() {
      return IconTheme(
        data:  IconThemeData(color: Colors.black),
        child:  Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child:  Row(
            children: <Widget>[
              Flexible(
                child:  TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration:  InputDecoration.collapsed(
                      hintText: "Send a message",
                      hintStyle: TextStyle(color: Colors.black)
                  ),
                ),
              ),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 4.0),
                child:  IconButton(
                    icon:  Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ),
            ],
          ),
        ),

      );
    }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/apolloai_patient.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message =  ChatMessage(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Apollo",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });

  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message =  ChatMessage(
      text: text,
      name: loggedInUser.email,
      type: true,
    );
    setState(() {
      if (message != null) {
        _messages.insert(0, message);
      }
    });
    print("test = " + text);
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title:  Text("Apollo: Smart Disease Assistant", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body:  Column(children: <Widget>[
        Flexible(
          child:  ListView.builder(
            padding:  EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration:  BoxDecoration(color: Colors.white,
          ),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child:  CircleAvatar(child:  Text('B', style: TextStyle(color: Colors.black))),
      ),
      Expanded(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child:  Text(text, style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name, style: TextStyle(color: Colors.black)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child:  Text(text, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child:  CircleAvatar(
            child:  Text(
              this.name[0],
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
