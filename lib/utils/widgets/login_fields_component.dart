import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import 'customButton.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({Key key, this.type}) : super(key: key);
  final String type;

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();
  bool isValid = true;
  bool isLoading = false;

  ///void Dispose Method
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _surnameFocusNode.dispose();

    super.dispose();
  }

  List<Widget> _buildChildren() {
    return [
      widget.type == Rd.registerText
          ? TextField(
              focusNode: _nameFocusNode,
              controller: _nameController,
              textInputAction: TextInputAction.next,
              // onChanged: (name) => print(name),
              onEditingComplete: () {
                if (_nameController.text.isNotEmpty) {
                  FocusScope.of(context).requestFocus(_surnameFocusNode);
                }
              },
              decoration: InputDecoration(
                labelText: 'Nom',
                errorText: _nameController.text.isEmpty && isValid == false
                    ? Rd.inValidNameErrorText
                    : null,
                enabled: isLoading == false,
              ))
          : Opacity(opacity: 0),
      widget.type == Rd.registerText
          ? TextField(
              focusNode: _surnameFocusNode,
              controller: _surnameController,
              textInputAction: TextInputAction.next,
              // onChanged: (surname) => print(surname),
              onEditingComplete: () {
                if (_surnameController.text.isNotEmpty) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                }
              },
              decoration: InputDecoration(
                labelText: 'Prenom',
                errorText: _surnameController.text.isEmpty && isValid == false
                    ? Rd.inValidSurnameErrorText
                    : null,
                enabled: isLoading == false,
              ))
          : Opacity(opacity: 0),
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 20.0),
      CustomButton(
        onPressed: () {
          if (widget.type == Rd.registerText) {
            if (_nameController.text.isNotEmpty &&
                _surnameController.text.isNotEmpty &&
                _emailController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              print('The user is ready to be saved in the database as :'
                  ' Name ${_nameController.text}, Surname : ${_surnameController.text} ,Email: ${_emailController.text} ,');
              Navigator.pushReplacementNamed(context, RouteNames.homePage);
            } else {
              setState(() {
                isValid = false;
              });
            }
          } else {
            if (_emailController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              Navigator.pushReplacementNamed(context, RouteNames.homePage);
              print('The user is already saved in the database as :'
                  ' Email: ${_emailController.text} ,');
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

  Widget _buildEmailTextField() {
    return TextField(
      focusNode: _emailFocusNode,
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'patient@hopital.com',
          errorText: _emailController.text.isEmpty && isValid == false
              ? Rd.inValidEmailErrorText
              : null,
          enabled: isLoading == false),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      //  onEditingComplete: () => print('$_emailController, $_nameController'),
      // onChanged: (email) => print('$_emailController, '),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Mot de passe',
          errorText: _passwordController.text.isEmpty && isValid == false
              ? Rd.inValidEmailErrorText
              : null,
          enabled: isLoading == false),
      obscureText: true,
      textInputAction: TextInputAction.done,
      //  onEditingComplete: () => print('$_emailController, $_nameController'),
      // onChanged: (password) => print('$_passwordController,'),
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
