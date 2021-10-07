import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:e_rdv_health/utils/theme/theme.dart';
import 'package:e_rdv_health/utils/widgets/login_fields_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildTop(),
              buildTextField(),
              buildCustomButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomButton(context) {
    return TextButton(
      onPressed: () =>
          Navigator.pushReplacementNamed(context, RouteNames.registerPage),
      child: Text(
        Rd.dontHaveAnAccountText,
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w500, color: Colors.red),
      ),
    );
  }

  Widget buildTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80),
        Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        SizedBox(height: 10),
        Text(
          Rd.welcomeText,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
        ),
        Text(
          'E-RDV',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: Colors.lightGreen),
        ),
        SizedBox(height: 30),
        Text(
          Rd.helloText,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          Rd.descriptionText,
          style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 13,
              color: Colors.grey.shade400),
        )
      ],
    );
  }
}

Widget buildTextField() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: LoginFields(
      type: 'login',
    ),
  );
}
