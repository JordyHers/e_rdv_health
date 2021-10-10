import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ERdv());
}

class ERdv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-RDV',
      theme: ThemeData(
          primaryColor: Colors.grey,
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
      routes: Routes.getRoute(),
      initialRoute: RouteNames.landingPage,
    );
  }
}
