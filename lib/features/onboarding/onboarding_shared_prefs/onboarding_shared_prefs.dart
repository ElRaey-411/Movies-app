import 'package:shared_preferences/shared_preferences.dart';

class OnboardingSharedPrefs {
  static Future<bool> getOnboardingState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_first_time") ?? true;
  }

  static Future<bool> saveOnboardingState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("is_first_time", false);
  }
}
