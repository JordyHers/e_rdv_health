import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:e_rdv_health/utils/widgets/custom_appBar.dart';
import 'package:e_rdv_health/view/rdv_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () => print('Notification pressed'))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListUserView()));
                print('OBTENEZ UN RDV');
              },
              child: Card(
                  child: Container(
                color: Colors.lightGreenAccent,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                width: 370,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Obtenez un ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'rendez-vous',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/appointment.png',
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
              )),
            ),
            InkWell(
              onTap: () {
                print('CONSULTEZ LA LISTE');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListUserView()));
              },
              child: Card(
                  child: Container(
                decoration: BoxDecoration(color: Colors.lightGreenAccent),
                height: 100,
                width: 370,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Consultez la liste',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'de Rendez-vous',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/appointment.png',
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ],
                )),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
