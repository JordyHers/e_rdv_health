import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/view/home_view.dart';
import 'package:e_rdv_health/view/landing_screen.dart';
import 'package:e_rdv_health/view/login_page.dart';
import 'package:e_rdv_health/view/rdv_list_view.dart';
import 'package:e_rdv_health/view/rdv_view.dart';
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
      RouteNames.rdvListPage: (_) => RdvView(),
      RouteNames.rdvFormPage: (_) => RdvForm(),
      RouteNames.landingPage: (_) => Loading(),
    };
  }
}

class RouteNames {
  static final String homePage = '/home_page';
  static final String registerPage = '/register_page';
  static final String loginPage = '/login_page';
  static final String rdvListPage = '/rdv_list_view';
  static final String rdvFormPage = '/rdv_view';
  static final String landingPage= '/landing_screen';
}
