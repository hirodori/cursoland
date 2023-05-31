// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: 200,
              color: Color.fromARGB(255, 143, 143, 143),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 21, 21, 21),
                  radius: 65,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'name of user',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: (() {}), icon: Icon(Icons.edit))
                    ],
                  ),
                )
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
}
