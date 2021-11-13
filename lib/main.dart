import 'package:e_rdv_health/service/database/http_request.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ERdv());
}

class ERdv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => HttpService.instance,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-RDV',
        theme: ThemeData(
            primaryColor: Colors.grey,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        routes: Routes.getRoute(),
        initialRoute: RouteNames.loginPage,
      ),
    );
  }
}
