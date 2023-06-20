// ignore_for_file: prefer_const_constructors

import 'package:courseland/modules/user.dart';
import 'package:courseland/modules/user_preferences.dart';
import 'package:courseland/screens/edit_profile_page.dart';
import 'package:courseland/widgets/profile_card.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            'SETTINGS',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              color: Color.fromARGB(255, 143, 143, 143),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                /*CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 21, 21, 21),
                  radius: 65,
                ),*/
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
                  child: buildUpgradeButton(),
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onTap: () {},
              title: Text('Get Premium'),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              onTap: () {},
              title: Text('Dark Mode'),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            /* ListTile(
              leading: Icon(),
              title: Text(''),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            )*/
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.black),
          ),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade to Premium',
        onClicked: () {},
      );
}
