import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/widgets/customTextField.dart';
import 'package:e_rdv_health/utils/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class ListUserView extends StatefulWidget {
  ListUserView({
    Key key,
  }) : super(key: key);

  @override
  _ListUserViewState createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  String clinic = 'SOS MEDECIN';
  String branch = 'MEDECIN GENERALISTE';

  //TODO: FETCH THE DATA OF THE CLINIC FROM API and PARSE JSON
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Choisissez une clinique',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            value: clinic,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 21,
            elevation: 16,
            style: const TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
              color: Colors.lightGreen,
            ),
            onChanged: (newValue) {
              setState(() {
                clinic = newValue;
              });
            },
            items: <String>['SOS MEDECIN', 'JEANNE EBORI', 'CHU-ANGONDJE']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Choisissez une branche',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            value: branch,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 21,
            elevation: 16,
            style: const TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
              color: Colors.lightGreen,
            ),
            onChanged: (newValue) {
              setState(() {
                branch = newValue;
              });
            },
            items: <String>['MEDECIN GENERALISTE', 'CARDIOLOGIE', 'GYNECOLOGIE']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
