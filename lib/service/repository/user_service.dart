import 'dart:convert';
import 'dart:io';

import 'package:e_rdv_health/constants/endpoints_constants.dart';
import 'package:e_rdv_health/models/api_response.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

// User
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
        Uri.parse(userURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  }
  catch(e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Update user
Future<ApiResponse> updateUser(String name, String? image) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(
        Uri.parse(userURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: image == null ? {
          'name': name,
        } : {
          'name': name,
          'image': image
        });
    // user can update his/her name or name and image

    switch(response.statusCode) {
      case 200:
        apiResponse.data =jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  }
  catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

// Get base64 encoded image
String? getStringImage(File? file) {
  if (file == null) return null ;
  return base64Encode(file.readAsBytesSync());
}