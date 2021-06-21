import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '127.0.0.1',
                port = '3306',
                user = 'root',
                password = 'osarmovi409',
                db = 'running';
                

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'osarmovi409',
      db: 'running'
    );
    return await MySqlConnection.connect(settings);
  }
}