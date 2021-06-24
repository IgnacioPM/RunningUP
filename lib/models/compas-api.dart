import 'compas.dart';
import 'package:http/http.dart' as http;

Future<List<Compas>> fetchCompas() async {
  final response = await http.get(Uri.parse('https://runningup.000webhostapp.com/compas.php'));

  return compasFromJson(response.body);
}
