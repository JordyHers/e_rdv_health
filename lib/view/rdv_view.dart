import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:flutter/material.dart';


class RdvForm extends StatefulWidget {
  RdvForm({
    Key key,
  }) : super(key: key);

  @override
  _RdvFormState createState() => _RdvFormState();
}

class _RdvFormState extends State<RdvForm> {
  String value ;
  String clinic = 'SOS MEDECIN';
  String branch = 'MEDECIN GENERALISTE';
  List<String> branches =['MEDECIN GENERALISTE', 'CARDIOLOGIE', 'GYNECOLOGIE'];
  List<String> hours = ['8:00 - 9:00','10:00 - 11:00','12:00 - 13:00','14:00 - 15:00','16:00 - 17:00'];

  int hour;
  int min;
  TimeOfDay _time ;
  bool isTimeChosen = false;

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,

    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  //TODO: FETCH THE DATA OF THE CLINIC FROM API and PARSE JSON
  @override
  void initState() {
    super.initState();
    min = DateTime.now().minute;
    hour = DateTime.now().hour;
    _time = TimeOfDay(hour: 24, minute: 60);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.settings))
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Choisissez une clinique',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                height: 1,
                color: Colors.black12,
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
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                height: 1,
                color: Colors.black12,
              ),
              onChanged: (newValue) {
                setState(() {
                  branch = newValue;
                });
              },
              items: branches.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 8),
            Text(
              'Choisissez une tranche horaire:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 200,
              width: 450,
              child: ListView(
                children: [
                  ...Iterable<int>.generate(5).map(
                    (int index) =>  InkWell(
                      onTap: (){
                        setState(() {
                          value = hours[index];
                          isTimeChosen = !isTimeChosen;
                        });
                        print('Card tapped');
                      },
                      child: Card(
                      elevation:10,
                      child: Container(
                        color:  Colors.blueGrey.shade50,
                        height: 55,
                        child: Center(
                          child: Text(hours[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                        ),
                      ),
                  ),
                    )
                  )],
              ),
            ),
            SizedBox(height: 30),
            Text('Vos Heures', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),),
            value != null ? Text(value,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 13,letterSpacing: 2,color: Colors.red)): Opacity(opacity: 0),
            SizedBox(height:80),
            CustomButton(text: 'Valider',)

          ],
        ),
      ),
    );
  }
}
