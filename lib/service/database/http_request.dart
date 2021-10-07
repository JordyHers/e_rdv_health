import 'package:http/http.dart' as http;

abstract class HttpReq {
  Future<String?> getApiListOfHospitals() async {}
}

const URL = 'https://example.com/whatsit/create';

class HttpRequest extends HttpReq {
  @override
  Future<String?> getApiListOfHospitals() async {
    var url = Uri.parse(URL);
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
