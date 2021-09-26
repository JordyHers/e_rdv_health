import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import 'customButton.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({Key key, this.type, this.isLoading}) : super(key: key);
  final String type;
  final bool isLoading;

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
              onChanged: (name) => print(name),
              onEditingComplete: () {
                if (_nameController.text.isNotEmpty) {
                  FocusScope.of(context).requestFocus(_surnameFocusNode);
                }
              },
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: _nameController.text.isEmpty && isValid == false
                    ? Rd.inValidNameErrorText
                    : null,
                enabled: widget.isLoading == false,
              ))
          : Opacity(opacity: 0),
      widget.type == Rd.registerText
          ? TextField(
              focusNode: _surnameFocusNode,
              controller: _surnameController,
              textInputAction: TextInputAction.next,
              onChanged: (surname) => print(surname),
              onEditingComplete: () {
                if (_surnameController.text.isNotEmpty) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                }
              },
              decoration: InputDecoration(
                labelText: 'Surname',
                errorText: _surnameController.text.isEmpty && isValid == false
                    ? Rd.inValidSurnameErrorText
                    : null,
                enabled: widget.isLoading == false,
              ))
          : Opacity(opacity: 0),
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      CustomButton(
        onPressed: () => print(
            'The user is ready to be saved in the database as :'
            ' Name ${_nameController.text}, Surname : ${_surnameController.text} ,Email: ${_emailController.text} ,'),
        text: Rd.signInButtonText,
      ),
      SizedBox(height: 8.0),
      Visibility(
        visible: !widget.isLoading && widget.type == 'register' ? true : false,
        child: FlatButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, RouteNames.registerPage),
          child: Text(Rd.alreadyHaveAnAccountText),
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
          hintText: 'test@test.com',
          errorText: _emailController.text.isEmpty && isValid == false
              ? Rd.inValidEmailErrorText
              : null,
          enabled: widget.isLoading == false),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => print('$_emailController, $_nameController'),
      onChanged: (email) => print('$_emailController, '),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          errorText: _passwordController.text.isEmpty && isValid == false
              ? Rd.inValidEmailErrorText
              : null,
          enabled: widget.isLoading == false),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => print('$_emailController, $_nameController'),
      onChanged: (password) => print('$_passwordController,'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
