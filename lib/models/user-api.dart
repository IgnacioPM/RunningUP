import 'user.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://runningup.000webhostapp.com/user.php'));
    
  return usersFromJson(response.body);
}

Future<Users> searchUsers(String email) async {


  final response = await http.post(
    Uri.parse('https://runningup.000webhostapp.com/consulta.php'),
    body: { 'email': email }
  );

  print('response response response');
  print(response.body);
    
  return usersFromJson(response.body).first;
}
