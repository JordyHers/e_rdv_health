import 'package:e_rdv_health/view/home_view.dart';
import 'package:flutter/material.dart';
import 'constants/Strings.dart';
import 'models/user_model.dart';

void main() {
  runApp(ERdv());
}

class ERdv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(title: Rd.title),
    );
  }
}
