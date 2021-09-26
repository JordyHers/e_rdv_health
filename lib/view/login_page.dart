import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:e_rdv_health/utils/theme/theme.dart';
import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:e_rdv_health/utils/widgets/login_fields_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
    return Positioned(
      bottom: 2,
      child: TextButton(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, RouteNames.registerPage),
        child: Text(
          Rd.alreadyHaveAnAccountText,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.red),
        ),
      ),
    );
  }

  Widget buildTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80),
        Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        SizedBox(height: 10),
        Text(
          'Hello There',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
        ),
        SizedBox(height: 40),
        Text(
          'Welcome',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.grey.shade600),
        ),
        Text(
          'Helps the user schedule appointements with different clinics.',
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
