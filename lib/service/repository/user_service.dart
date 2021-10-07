import 'dart:convert';

import 'package:e_rdv_health/constants/endpoints_constants.dart';
import 'package:e_rdv_health/models/api_response.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse?> login(String phone, String password) async {
  ApiResponse _api = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {"Accept": 'application/json'},
        body: {'phone': phone, 'password': password});
    switch (response.statusCode) {
      case 200:
        _api.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        _api.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        _api.error = jsonDecode(response.body)['message'];
        break;
      default:
        _api.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    _api.error = serverError;
  }
  return _api;
}

Future<ApiResponse?> register(String name, String surname, String gender,
    String email, String phone, String password) async {
  ApiResponse _api = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      "Accept": 'application/json'
    }, body: {
      'name': name,
      'surname': surname,
      'gender': gender,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': password
    });
    switch (response.statusCode) {
      case 200:
        _api.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        _api.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        _api.error = jsonDecode(response.body)['message'];
        break;
      default:
        _api.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    _api.error = serverError;
  }
  return _api;
}
