import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/theme/theme.dart';
import 'package:e_rdv_health/utils/widgets/login_fields_component.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildHeader(),
              buildTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Creer votre',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          ),
          Text(
            'compte',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.lightGreen),
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: LoginFields(
        type: Rd.registerText,
      ),
    );
  }
}
