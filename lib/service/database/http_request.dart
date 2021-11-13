import 'dart:convert';

import 'package:e_rdv_health/models/clinic_model.dart';
import 'package:http/http.dart' as http;

abstract class HttpReq {}

const URL = 'http://erendezvoussante.online/api/cliniques';

class HttpService extends HttpReq {
  static final instance = HttpService();
  Future<List<Clinic>> get clinics => fetchClinic();
  // A function that converts a response body into a List<Photo>.
  List<String> specialities = [];
  @override
  List<Clinic> parseClinic(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final clinics =
        parsed.map<Clinic>((json) => Clinic.fromJson(json)).toList();
    return clinics;
  }

  @override
  Future<List<Clinic>> fetchClinic() async {
    final response = await http.get(Uri.parse(URL));
    // Use the compute function to run parsePhotos in a separate isolate.
    print(' _________ PARSED CLINICS ______');
    print(parseClinic(response.body));
    var clin = parseClinic(response.body);
    print(' _________ EACH SPECIALITY ______');
    print(clin.map((e) => e.specialities));

    clin.map((e) => e.specialities).forEach((element) {
      (element?.forEach((element) {
        print(element.libelle);
        specialities.add(element.libelle);
      }));
    });
    print(' _________ LIST AFTER FINAL PARSING ______');
    print(specialities);
    return parseClinic(response.body);
  }
}
