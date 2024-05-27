import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class IntroSharedPreferences {

  Future<bool> isFirstTimeIntroDisplaying() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool("IntroIsFirst") ?? false;
  }

  Future setIntroPageHasBeenSeen(bool intro) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("IntroIsFirst", intro);
  }
}