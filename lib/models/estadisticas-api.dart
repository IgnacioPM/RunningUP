import 'package:http/http.dart' as http;

import 'estadisticas.dart';

Future<List<Estadisticas>> fetchEstadisticas(String useriduser) async {
  final response = await http.post(
      Uri.parse('https://runningup.000webhostapp.com/estadisticas.php'),
      body: {'user_iduser': useriduser});
  return estadisticasFromJson(response.body);
}
