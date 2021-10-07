import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/exceptions/error_widget.dart';
import 'package:flutter/material.dart';

class RdvView extends StatelessWidget {
  const RdvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: buildContent(),
    );
  }
}

buildContent() {
  return FutureBuilder(
    future: Future.delayed(Duration(seconds: 4)),
    builder: (BuildContext context, snapshot) {
      // AsyncSnapshot<Your object type>
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Veuillez patientez ...',
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
          return CustomErrorWidget(text: Rd.noAppointmentText);
      }
    },
  );
}
