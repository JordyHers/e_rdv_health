import 'package:http/http.dart' as http;

abstract class HttpReq {
  Future<String?> getApiListOfHospitals() async {}
}

const URL = 'http://erendezvoussante.online/api/cliniques';

class HttpRequest extends HttpReq {
  @override
  Future<String?> getApiListOfHospitals() async {
    var url = Uri.parse(URL);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
