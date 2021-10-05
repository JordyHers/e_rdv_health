import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:e_rdv_health/utils/widgets/customTextField.dart';
import 'package:flutter/material.dart';

import 'customButton.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({Key key, this.type}) : super(key: key);
  final String type;

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _profileController = TextEditingController();

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _profileFocusNode = FocusNode();

  bool isValid = true;
  bool isLoading = false;

  String gender = 'Homme';

  ///void Dispose Method
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _profileController.dispose();

    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    _profileFocusNode.dispose();

    super.dispose();
  }

  List<Widget> _buildChildren(context) {
    return [
      widget.type == Rd.registerText
          ? CustomTextField(
              focusNode: _nameFocusNode,
              nextFocusNode: _surnameFocusNode,
              controller: _nameController,
              isValid: isValid,
              isLoading: isLoading,
              label: 'Nom',
              icon: Icons.account_circle_rounded,
              errorText: Rd.inValidNameErrorText,
            )
          : Opacity(opacity: 0),
      SizedBox(height: 10),
      widget.type == Rd.registerText
          ? CustomTextField(
              focusNode: _surnameFocusNode,
              nextFocusNode: _emailFocusNode,
              controller: _surnameController,
              isValid: isValid,
              isLoading: isLoading,
              label: 'Prenom',
              icon: Icons.account_circle_rounded,
              errorText: Rd.inValidSurnameErrorText,
            )
          : Opacity(opacity: 0),
      SizedBox(height: 10),
      widget.type == Rd.registerText
          ? CustomTextField(
              focusNode: _emailFocusNode,
              nextFocusNode: _profileFocusNode,
              controller: _emailController,
              isValid: isValid,
              isLoading: isLoading,
              label: 'Email',
              icon: Icons.alternate_email,
              errorText: Rd.inValidEmailErrorText,
            )
          : Opacity(opacity: 0),
      SizedBox(height: 10),
      _buildPhoneTextField(),
      SizedBox(height: 10.0),
      _buildPasswordTextField(),
      SizedBox(height: 10),
      widget.type == Rd.registerText
          ? DropdownButton<String>(
              isExpanded: true,
              value: gender,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 21,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue;
                });
              },
              items: <String>[
                'Homme',
                'Femme',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          : Opacity(opacity: 0),
      SizedBox(height: 20.0),
      CustomButton(
        onPressed: () async {
          if (widget.type == Rd.registerText) {
            if (_nameController.text.isNotEmpty &&
                _surnameController.text.isNotEmpty &&
                _phoneController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty &&
                _emailController.text.isNotEmpty) {
              print('The user is ready to be saved in the database as :'
                  ' Name ${_nameController.text}, Surname : ${_surnameController.text} ,Email: ${_phoneController.text} ,');
              // Navigator.pushReplacementNamed(context, RouteNames.homePage);
              await _buildAlertDialog(context);
            } else {
              setState(() {
                isValid = false;
              });
            }
          } else {
            if (_phoneController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              Navigator.pushReplacementNamed(context, RouteNames.homePage);
              print('The user is already saved in the database as :'
                  ' Email: ${_phoneController.text} ,');
            } else {
              setState(() {
                isValid = false;
              });
            }
          }
        },
        text: widget.type == Rd.registerText
            ? Rd.createAccountButtonText
            : Rd.signInButtonText,
      ),
      SizedBox(height: 8.0),
      Visibility(
        visible: !isLoading && widget.type == Rd.registerText ? true : false,
        child: TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, RouteNames.loginPage),
          child: Text(
            Rd.alreadyHaveAnAccountText,
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.red),
          ),
        ),
      ),
    ];
  }

  ///------------------------------ Widgets -------------------------------------------------

  Widget _buildPhoneTextField() {
    return CustomTextField(
      focusNode: _phoneFocusNode,
      nextFocusNode: _passwordFocusNode,
      controller: _phoneController,
      isValid: isValid,
      isLoading: isLoading,
      label: 'Numero',
      hintText: '+241 XXXXXX',
      phone: true,
      icon: Icons.phone,
      errorText: Rd.inValidPhoneErrorText,
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      focusNode: _passwordFocusNode,
      // nextFocusNode: _passwordFocusNode,
      controller: _passwordController,
      isValid: isValid,
      isLoading: isLoading,
      label: 'Mot de passe',
      icon: Icons.lock,
      password: true,
      errorText: Rd.inValidPasswordErrorText,
    );
  }

  _buildAlertDialog(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enregistrement reussi'),
          content: Text("Retourner a la page de connexion"),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, RouteNames.loginPage),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(context),
      ),
    )));
  }
}
