import 'package:flutter/material.dart';

import '../date/local_data.dart';
import '../models/setting_model.dart';

class SettingsController extends ChangeNotifier {
  final LocalData? themeModeData;
  final LocalData? sizeTextData;
  final appTheme = AppTheme(themeMode: ThemeMode.system);
  final sizeText = SizeText(size: 14);

  SettingsController({this.themeModeData, this.sizeTextData});

  Future<void> loadTheme() async {
    if (themeModeData != null) {
      bool isDark = await themeModeData!.getThemeMode();
      appTheme.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  void toggleTheme(bool isDark) {
    if (themeModeData != null) {
      appTheme.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      themeModeData!.saveThemeMode(isDark);
      notifyListeners();
    }
  }

  Future<void> loadSizeText() async {
    if (sizeTextData != null) {
      double size = await sizeTextData!.getSizeText();
      sizeText.size = size;
      notifyListeners();
    }
  }

  void setSizeText(double size) {
    if (sizeTextData != null) {
      sizeText.size = size;
      sizeTextData!.saveSizeText(size);
      notifyListeners();
    }
  }
}