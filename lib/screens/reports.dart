import 'package:courseland/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:courseland/modules/user_preferences.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = UserPreferences.getDarkMode();

    if (isDarkMode == true) {
      return buildDarkScreen();
    } else {
      return buildWhiteScreen();
    }
  }

  Widget buildDarkScreen() => const SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          body: BarChartSample3(),
        ),
      );

  Widget buildWhiteScreen() => const SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: BarChartSample3(),
        ),
      );
}
