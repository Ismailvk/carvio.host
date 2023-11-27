import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();
  static final _instance = SharedPreference._();
  static SharedPreference get instance => _instance;

  static const String email = 'email';
  static const String password = 'password';
  static const String token = 'token';

  late SharedPreferences sharedPref;

  initStorage() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  storeToken(hostToken) async {
    await sharedPref.setString(token, hostToken);
  }

  removeToken() async {
    await sharedPref.remove(token);
  }

  String? getToke() {
    return sharedPref.getString(token);
  }
}
