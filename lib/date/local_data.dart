import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static const String _themeKey = "themeMode";
  static const String _sizeTextKey = "sizeText";

  Future<void> saveThemeMode(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(_themeKey, isDark);
  }

  Future<bool> getThemeMode() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_themeKey) ?? false;
  }

  Future<void> saveSizeText(double size) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(_sizeTextKey, size);
  }

  Future<double> getSizeText() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(_sizeTextKey) ?? 14.0;
  }
}