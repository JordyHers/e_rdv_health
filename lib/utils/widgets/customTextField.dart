import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextEditingController controller;
  final bool isValid;
  final bool isLoading;
  final String label;
  final String hintText;
  final IconData icon;
  final String errorText;
  final bool phone;
  final bool password;

  const CustomTextField(
      {Key? key,
      required this.focusNode,
      required this.nextFocusNode,
      required this.controller,
      required this.isValid,
      required this.isLoading,
      required this.hintText,
      required this.label,
      required this.icon,
      this.password = false,
      required this.errorText,
      this.phone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      textInputAction:
          password == true ? TextInputAction.done : TextInputAction.next,
      // onChanged: (name) => print(name),
      onEditingComplete: () {
        if (controller.text.isEmpty) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).requestFocus(nextFocusNode);
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: phone == true ? hintText : null,
        prefixIcon: Icon(icon),
        errorText:
            controller.text.isEmpty && isValid == false ? errorText : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabled: isLoading == false,
      ),
      keyboardType: phone == true ? TextInputType.phone : TextInputType.text,
      obscureText: password == true ? true : false,
    );
  }
}
