import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  CustomButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextButton(
        onPressed: onPressed,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.greenAccent, Colors.blueAccent],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 88.0,
                minHeight: 36.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
