import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String text;
  const CustomErrorWidget({
    Key key,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
          SizedBox(height: 10),
          Icon(Icons.error,size: 45,),
        ],
      ),
    );
  }
}