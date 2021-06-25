import 'package:http/http.dart' as http;

import 'estadisticas.dart';

Future<List<Estadisticas>> fetchEstadisticas() async {
  final response = await http.get(Uri.parse('https://runningup.000webhostapp.com/estadisticas.php'));

  return estadisticasFromJson(response.body);
}
