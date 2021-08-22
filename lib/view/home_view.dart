import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/view/rdv_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Rd.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                'Home View',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListUserView())),
                child: Text('Next')),
          )
        ],
      ),
    );
  }
}
