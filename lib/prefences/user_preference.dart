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

  set userNameDrawer(String value) {
    _prefs.setString('user_name_drawer', value);
  }

  String get userNameDrawer {
    return _prefs.getString('user_name_drawer');
  }

  set userAp1Drawer(String value) {
    _prefs.setString('user_ap1_drawer', value);
  }

  String get userAp1Drawer {
    return _prefs.getString('user_ap1_drawer');
  }

  set userAp2Drawer(String value) {
    _prefs.setString('user_ap2_drawer', value);
  }

  String get userAp2Drawer {
    return _prefs.getString('user_ap2_drawer');
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

  set userEmail(String value) {
    _prefs.setString('user_email', value);
  }

  String get userEmail {
    return _prefs.getString('user_email');
  }
}
