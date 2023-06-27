import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseland/modules/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = LocalUser(
    //id: 'aaa',
    imagePath:
        'https://i.pinimg.com/564x/c5/9e/42/c59e4220f5710c277cfd9d0f137b13f5.jpg',
    name: 'Random Aleatório',
    email: 'random@gmail.com',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(LocalUser user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : LocalUser.fromJson(jsonDecode(json));
  }

/*
  Stream<List<LocalUser>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => LocalUser.fromJson(doc.data())).toList());
*/
}
