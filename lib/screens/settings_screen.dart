import 'package:courseland/modules/user.dart';
import 'package:courseland/modules/user_preferences.dart';
import 'package:courseland/screens/edit_profile_page.dart';
import 'package:courseland/widgets/profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courseland/widgets/button_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    var isPremium = UserPreferences.getPremium();
    var isDarkMode = UserPreferences.getDarkMode();

    if (isDarkMode == true) {
      return buildDarkScreen(user, isPremium);
    } else {
      return buildWhiteScreen(user, isPremium);
    }
  }

  Widget buildWhiteScreen(LocalUser user, var isPremium) => SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.greenAccent,
              title: const Text(
                'SETTINGS',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(
                    CupertinoIcons.square_arrow_left,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Container(
                  height: 300,
                  color: const Color.fromARGB(255, 150, 150, 150),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileWidget(
                        imagePath: user.imagePath,
                        onClicked: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      buildName(user),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: isPremium == null || isPremium == false
                            ? buildUpgradeButton()
                            : buildPremiumText(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildDarkMode(),
              ],
            ),
          ),
        ),
      );

  Widget buildDarkScreen(LocalUser user, var isPremium) => SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.greenAccent,
              title: const Text(
                'SETTINGS',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(
                    CupertinoIcons.square_arrow_left,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Container(
                  height: 300,
                  color: const Color.fromARGB(255, 150, 150, 150),
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileWidget(
                      imagePath: user.imagePath,
                      onClicked: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
                        );
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    buildName(user),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: isPremium == null || isPremium == false
                          ? buildUpgradeButton()
                          : buildPremiumText(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildWhiteMode(),
              ],
            ),
          ),
        ),
      );

  Widget buildName(LocalUser user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade to Premium',
        onClicked: () {
          UserPreferences.setPremium(true);
          setState(() {});
        },
      );

  Widget buildPremiumText() => ButtonWidget(
        text: 'You are already a Premium User',
        onClicked: () {
          UserPreferences.setPremium(false);
          setState(() {});
        },
      );

  Widget buildDarkMode() => ListTile(
        leading: const Icon(
          Icons.dark_mode,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onTap: () {
          UserPreferences.setDarkMode(true);
          setState(() {});
        },
        title: const Text(
          'Dark Mode',
          style: TextStyle(color: Colors.black),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      );

  Widget buildWhiteMode() => ListTile(
        leading: const Icon(
          Icons.dark_mode,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onTap: () {
          UserPreferences.setDarkMode(false);
          setState(() {});
        },
        title: const Text(
          'White Mode',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      );
}
