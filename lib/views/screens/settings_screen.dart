import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:homework_48/models/setting_model.dart';
import 'package:homework_48/providers/settings_notifier.dart';
import '../widgets/custom_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void changeAppBarColor(Color color) {
    AppBarColor.appBarColor = color;
    setState(() {});
  }

  void changeScaffoldColor(Color color){
    ScaffoldColor.scaffoldColor = color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = SettingsNotifier.of(context);
    return Scaffold(
      backgroundColor: ScaffoldColor.scaffoldColor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppBarColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListenableBuilder(
              listenable: settingsNotifier,
              builder: (context, child) {
                return SwitchListTile(
                  title: Text(
                    "Dark mode",
                    style: TextStyle(fontSize: settingsNotifier.sizeText.size),
                  ),
                  value: settingsNotifier.appTheme.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    settingsNotifier.toggleTheme(value);
                  },
                );
              },
            ),
            ListenableBuilder(
              listenable: settingsNotifier,
              builder: (context, child) {
                return Slider(
                  value: settingsNotifier.sizeText.size,
                  min: 12,
                  max: 30,
                  divisions: 18,
                  label: settingsNotifier.sizeText.size.toString(),
                  onChanged: (value) async {
                    settingsNotifier.setSizeText(value);
                    await settingsNotifier.loadSizeText();
                    // setState(() {});
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: (context),
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(20),
                      content: ColorPicker(
                          pickerColor: AppBarColor.appBarColor,
                          onColorChanged: changeAppBarColor),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
              )),
              child: const Text("Choice AppBar Color"),
            ),

            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: (context),
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(20),
                      content: ColorPicker(
                          pickerColor: AppBarColor.appBarColor,
                          onColorChanged: changeScaffoldColor),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  )),
              child: const Text("Choice Scaffold Color"),
            )
          ],
        ),
      ),
    );
  }
}
