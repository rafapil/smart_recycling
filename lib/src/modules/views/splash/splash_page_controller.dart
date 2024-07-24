import 'package:shared_preferences/shared_preferences.dart';

class SplashPageController {
  Future<bool> validatePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    return seen;
  }
}
