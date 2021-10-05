import 'package:flutter/material.dart';

class RdvView extends StatelessWidget {
  const RdvView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: buildContent() ,
    );
  }
}

 buildContent () {
  return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
    builder: (BuildContext context,  snapshot) {  // AsyncSnapshot<Your object type>
      if( snapshot.connectionState == ConnectionState.waiting){
        return  Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Veuillez patientez ...',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              SizedBox(height: 20),
              CircularProgressIndicator(backgroundColor: Colors.black,),
            ],
          ),
        );
      }else{
        if (snapshot.hasError)
          return Center(child: Text('Error: ${snapshot.error}'));
        else
          return Center(
            child: Text('Vous n\'avez pas de Rendez-vous !',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
          );
      }
    },



  );
}

