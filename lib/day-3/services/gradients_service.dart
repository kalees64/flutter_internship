import 'package:http/http.dart' as http;

const String API_URL = "http://127.0.0.1:8000/api/v1/";

Future<dynamic> fetchGradients() async {
  var url = API_URL + "gradients";
  return await http.get(Uri.parse(url));
}

Future<dynamic> fetchGradientById(int id) async {
  var url = API_URL + "gradients/" + id.toString();
  return await http.get(Uri.parse(url));
}
