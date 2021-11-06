import 'dart:convert';

import 'package:e_rdv_health/models/clinic_model.dart';
import 'package:e_rdv_health/models/specialities_model.dart';
import 'package:http/http.dart' as http;

abstract class HttpReq {}

const URL = 'http://erendezvoussante.online/api/cliniques';

class HttpService extends HttpReq {
  static final instance = HttpService();

  Future<List<Clinic>> get clinics => fetchClinic();
  // A function that converts a response body into a List<Photo>.
  @override
  List<Clinic> parseClinic(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Clinic>((json) => Clinic.fromJson(json)).toList();
  }

  @override
  List<Specialities> parseSpecialities(List<Clinic> clinics) {
    var spec;
    clinics.forEach((element) {
      spec = element.specialities!;
    });
    print(' _________ Specialities ______');
    print(spec);
    return spec!
        .map<Specialities>((json) => Specialities.fromJson(json))
        .toList();
  }

  @override
  Future<List<Clinic>> fetchClinic() async {
    final response = await http.get(Uri.parse(URL));
    // Use the compute function to run parsePhotos in a separate isolate.
    print(' _________ REPONSE BODY ______');
    print(response.body);
    return parseClinic(response.body);
  }
}
