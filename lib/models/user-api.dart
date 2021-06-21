import 'user.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers() async {
  String url = "https://runningup.000webhostapp.com/user.php";
  final response = await http.get(url);
  return usersFromJson(response.body);
}
