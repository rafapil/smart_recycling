import 'package:shared_preferences/shared_preferences.dart';

/// Controller da OnboardPage que define o valor para prefs
class OnboardPageController {
  Future<void> setPrefsToComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
  }
}
