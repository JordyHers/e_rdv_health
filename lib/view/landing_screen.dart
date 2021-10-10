import 'package:e_rdv_health/constants/endpoints_constants.dart';
import 'package:e_rdv_health/models/api_response.dart';
import 'package:e_rdv_health/service/repository/user_service.dart';
import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';




class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
    String token = await getToken();
    if(token == ''){
      Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.loginPage, (route) => false);
    }
    else {
      ApiResponse response = await getUserDetail();
      if (response.error == null){
        Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.homePage, (route) => false);      }
      else if (response.error == unauthorized){
        Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.loginPage, (route) => false);      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}