import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:e_rdv_health/utils/widgets/custom_appBar.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(Rd.title),
          Center(
            child: Container(
              child: Text(
                "Page d'acceuil",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: CustomButton(
                /*onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListUserView())),*/
                onPressed: () async {
                  await readJson();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListUserView(users: users)));
                },
                text: 'Next',
              ))
        ],
      ),
    );
  }
}
