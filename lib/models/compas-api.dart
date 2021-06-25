import 'compas.dart';
import 'package:http/http.dart' as http;

Future<List<Compas>> fetchCompas(String idUser) async {
  final response = await http.post(Uri.parse('https://runningup.000webhostapp.com/compas.php'),
  body: { 'idUser': idUser }
  
  );
  return compasFromJson(response.body);
}

