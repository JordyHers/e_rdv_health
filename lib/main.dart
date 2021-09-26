import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';

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
      routes: Routes.getRoute(),
      initialRoute: '/login_page',
    );
  }
}
