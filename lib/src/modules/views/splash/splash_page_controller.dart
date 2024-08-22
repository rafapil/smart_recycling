import 'package:shared_preferences/shared_preferences.dart';

/// Controller da SplashPage responsavel por acessar as preferencias da aplicação
class SplashPageController {
  Future<bool> validatePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    return seen;
  }
}
