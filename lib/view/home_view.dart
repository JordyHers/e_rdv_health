import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:e_rdv_health/view/rdv_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    var user = data['users'].map((element) => User.fromJson(element));
    users = data['users'];
    print(user.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Rd.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                'Home View',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: ElevatedButton(
                /*onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListUserView())),*/
                onPressed: () async {
                  await readJson();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListUserView(users: users)));
                },
                child: Text('Next')),
          )
        ],
      ),
    );
  }
}
