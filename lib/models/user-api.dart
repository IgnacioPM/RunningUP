import 'user.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://runningup.000webhostapp.com/user.php'));
  
  print('fetchUsers fetchUsers fetchUsers');
  print(response);
  
  return usersFromJson(response.body);
}
