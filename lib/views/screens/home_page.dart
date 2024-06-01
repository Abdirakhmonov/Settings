import 'package:flutter/material.dart';
import 'package:homework_48/models/setting_model.dart';
import 'package:homework_48/providers/settings_notifier.dart';

import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settingsNotifier = SettingsNotifier.of(context);
    settingsNotifier.loadSizeText();
  }

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = SettingsNotifier.of(context);
    return Scaffold(
      backgroundColor: ScaffoldColor.scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
        backgroundColor:AppBarColor.appBarColor,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Incididunt officia excepteur enim occaecat adipisicing est elit officia. Tempor cillum cupidatat duis in ullamco duis. Cillum irure quis Lorem exercitation nostrud culpa. Non cupidatat fugiat mollit in sit magna sint aute fugiat. Enim ad adipisicing quis laboris et ullamco ut esse ad proident. Labore duis voluptate aute tempor ut ut ipsum.",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: settingsNotifier.sizeText.size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}