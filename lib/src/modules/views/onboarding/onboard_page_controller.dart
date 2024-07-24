import 'package:shared_preferences/shared_preferences.dart';

class OnboardPageController {
  Future<void> setPrefsToComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
  }
}
