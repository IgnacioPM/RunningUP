import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static final UserPreference _instancia = new UserPreference._internal();

  factory UserPreference() {
    return _instancia;
  }

  UserPreference._internal();

  SharedPreferences _prefs;

  Future<bool> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    return true;
  }

  set userName(String value) {
    _prefs.setString('user_name', value);
  }

  String get userName {
    return _prefs.getString('user_name');
  }

  set userApe1(String value) {
    _prefs.setString('user_ap1', value);
  }

  String get userApe1 {
    return _prefs.getString('user_ap1');
  }

  set userApe2(String value) {
    _prefs.setString('user_ap2', value);
  }

  String get userApe2 {
    return _prefs.getString('user_ap2');
  }
}
