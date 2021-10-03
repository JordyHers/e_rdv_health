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

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();
  bool isValid = true;
  bool isLoading = false;

  ///void Dispose Method
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();

    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _surnameFocusNode.dispose();

    super.dispose();
  }

  List<Widget> _buildChildren() {
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
              nextFocusNode: _phoneFocusNode,
              controller: _surnameController,
              isValid: isValid,
              isLoading: isLoading,
              label: 'Prenom',
              icon: Icons.account_circle_rounded,
              errorText: Rd.inValidSurnameErrorText,
            )
          : Opacity(opacity: 0),
      SizedBox(height: 10),
      _buildPhoneTextField(),
      SizedBox(height: 10.0),
      _buildPasswordTextField(),
      SizedBox(height: 20.0),
      CustomButton(
        onPressed: () {
          if (widget.type == Rd.registerText) {
            if (_nameController.text.isNotEmpty &&
                _surnameController.text.isNotEmpty &&
                _phoneController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              print('The user is ready to be saved in the database as :'
                  ' Name ${_nameController.text}, Surname : ${_surnameController.text} ,Email: ${_phoneController.text} ,');
              Navigator.pushReplacementNamed(context, RouteNames.homePage);
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    )));
  }
}
