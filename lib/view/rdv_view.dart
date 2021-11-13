import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/clinic_model.dart';
import 'package:e_rdv_health/service/database/http_request.dart';
import 'package:e_rdv_health/utils/config/size_config.dart';
import 'package:e_rdv_health/utils/exceptions/error_widget.dart';
import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RdvForm extends StatefulWidget {
  RdvForm({
    Key? key,
  }) : super(key: key);

  @override
  _RdvFormState createState() => _RdvFormState();
}

class _RdvFormState extends State<RdvForm> {
  String? value;
  String clinic = 'CHAMBRIER';
  String branch = 'OPHTALMOLOGIE';
  List<Clinic>? clinics;
  List<String>? branches = [];
  List<Color> colors = [
    Colors.grey.shade50,
    Colors.grey.shade50,
    Colors.grey.shade50,
    Colors.grey.shade50,
    Colors.grey.shade50,
  ];
  List<String> hours = [
    '8:00 - 9:00',
    '10:00 - 11:00',
    '12:00 - 13:00',
    '14:00 - 15:00',
    '16:00 - 17:00'
  ];
  bool isSubmit = false;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HttpService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => print('Setting Button Pressed ...'),
          )
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: isSubmit == false
          ? FutureBuilder(
              future: Future.wait([
                provider.clinics.then((List<Clinic> value) => clinics = value)
              ]),
              builder: (context, _) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Choisissez une clinique',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                      onChanged: (String? newValue) {
                        setState(() {
                          clinic = newValue!;
                        });
                      },
                      items: clinics?.map<DropdownMenuItem<String>>((clinic) {
                        return DropdownMenuItem<String>(
                          value: clinic.name,
                          child: Text(clinic.name),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Choisissez une branche',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                      onChanged: (String? newValue) {
                        setState(() {
                          branch = newValue!;
                        });
                      },
                      items: branches!.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choisissez une tranche horaire:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.black12,
                      height: 200,
                      width: 450,
                      child: ListView(
                        children: [
                          ...Iterable<int>.generate(5)
                              .map((int index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        colors[index] == Colors.indigoAccent
                                            ? colors[index] =
                                                Colors.grey.shade50
                                            : colors[index] =
                                                Colors.indigoAccent;
                                        value = hours[index];
                                      });
                                      print('Card tapped');
                                    },
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        color: colors[index],
                                        height: 55,
                                        child: Center(
                                          child: Text(
                                            hours[index],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    value != null
                        ? Center(
                            child: Container(
                              height: 155,
                              width: 265,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Horaire: $value',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                            letterSpacing: 1,
                                            color: Colors.red)),
                                    SizedBox(height: 5),
                                    Text('Clinique: $clinic',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                            letterSpacing: 1,
                                            color: Colors.indigo)),
                                    SizedBox(height: 5),
                                    Text('Spécialité: $branch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                            color: Colors.indigo)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Opacity(opacity: 0),
                    CustomButton(
                      text: 'Confirmer',
                      onPressed: () {
                        setState(() {
                          _submit();
                        });
                      },
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            )
          : buildContainer(),
    );
  }

  _submit() {
    isSubmit = !isSubmit;
  }
}

class buildContainer extends StatelessWidget {
  const buildContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (BuildContext context, snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: SizeConfig.getHeight(context),
              width: SizeConfig.getWidth(context),
              color: Colors.black.withOpacity(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Connexion à la base de données...',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Erreur: ${snapshot.error}'));
          else
            return CustomErrorWidget(text: Rd.noDatabaseText);
        }
      },
    );
  }
}
