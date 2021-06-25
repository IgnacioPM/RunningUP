import 'package:http/http.dart' as http;

import 'estadisticas.dart';

Future<List<Estadisticas>> fetchEstadisticas(String useriduser) async {
  final response = await http.post(
      Uri.parse('https://runningup.000webhostapp.com/estadisticas.php'),
      body: {'user_iduser': useriduser});
  return estadisticasFromJson(response.body);
}

Future<List<Estadisticas>> fetchFama() async {
  final response = await http.get(
      Uri.parse('https://runningup.000webhostapp.com/fama.php'));
  return estadisticasFromJson(response.body);
}
