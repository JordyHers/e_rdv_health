import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/view/home_view.dart';
import 'package:e_rdv_health/view/login_page.dart';
import 'package:e_rdv_health/view/register_page.dart';
import 'package:flutter/cupertino.dart';

// Ici je cree une class map qui prend en charge les routes et la navigation entre
//pages de l'APPLICATION.

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      RouteNames.homePage: (_) => HomePage(title: Rd.title),
      RouteNames.registerPage: (_) => RegisterPage(),
      RouteNames.loginPage: (_) => LoginPage(),
    };
  }
}

class RouteNames {
  static final String homePage = '/home_page';
  static final String registerPage = '/register_page';
  static final String loginPage = '/login_page';
}
