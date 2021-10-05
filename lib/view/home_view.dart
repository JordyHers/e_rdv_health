import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:e_rdv_health/utils/config/size_config.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
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
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);

    return Scaffold(
        drawer: Drawer(
            elevation: 2,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.space,
              children: [
                Flexible(
                  flex: 2,
                  child: DrawerHeader(
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      foregroundColor: Colors.black,
                      radius: 35,
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      trailing: Icon(Icons.logout),
                      title: TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(RouteNames.loginPage),
                          child: Text(
                            'Se déconnecter',
                            style: TextStyle(color: Colors.black26),
                          )),
                    )),
              ],
            )),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              color: Colors.black,
              onPressed: () => print('Notification pressed'),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCard(context, width, height, 'Obtenez un ',
                      'Rendez-vous', 'hand'),
                  buildCard(context, width, height, 'Consultez la liste',
                      'de Rendez-vous', 'appointment'),
                ])));
  }

  Widget buildCard(
      BuildContext context, width, height, title, subtitle, image) {
    double fontSize(double size) {
      return size * width / 414;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListUserView()));
        print('OBTENEZ UN RDV');
      },
      child: Card(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        child: Stack(
          children: [
            Positioned.fill(
              top: 50,
              bottom: -200,
              left: 0,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blue[900].withOpacity(0.2),
                      blurRadius: 50,
                      spreadRadius: 2,
                      offset: Offset(20, 0)),
                  BoxShadow(
                      color: Colors.white12,
                      blurRadius: 0,
                      spreadRadius: -2,
                      offset: Offset(0, 0)),
                ], shape: BoxShape.circle, color: Colors.white30),
              ),
            ),
            Positioned.fill(
              top: -200,
              bottom: -100,
              left: -300,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blue[900].withOpacity(0.2),
                      blurRadius: 50,
                      spreadRadius: 2,
                      offset: Offset(20, 0)),
                  BoxShadow(
                      color: Colors.white12,
                      blurRadius: 0,
                      spreadRadius: -2,
                      offset: Offset(0, 0)),
                ], shape: BoxShape.circle, color: Colors.white30),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 300,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.topRight,
                        width: width / 1.8,
                        child: Image.asset(
                          "assets/images/$image.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: height / 10,
                        width: width / 1.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: fontSize(20),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(
                                  fontSize: fontSize(20),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
