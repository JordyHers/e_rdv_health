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
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildAvatar(),
              buildTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 60),
      child: CircleAvatar(
        radius: 75,
        backgroundColor: Colors.grey.withOpacity(0.4),
        child: Image.network(
          'https://www.seekpng.com/png/full/847-8474751_download-empty-profile.png',
          fit: BoxFit.scaleDown,
          height: 80,
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: LoginFields(
        type: 'register',
      ),
    );
  }
}
