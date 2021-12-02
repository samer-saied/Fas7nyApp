import 'package:shared_preferences/shared_preferences.dart';

class SharedSetting {
  getSetting(String settingName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(settingName) ?? 'empty';
  }

  setSetting(String settingName, String settingValue) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(settingName, settingValue);
  }
}
