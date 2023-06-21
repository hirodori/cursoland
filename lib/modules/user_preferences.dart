import 'dart:convert';

import 'package:courseland/modules/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'userl';
  static const myUser = Userl(
    imagePath:
        'https://i.pinimg.com/564x/c5/9e/42/c59e4220f5710c277cfd9d0f137b13f5.jpg',
    name: 'Fernando Kondo',
    email: 'fernandokondo@alunos.utfpr.edu.br',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(Userl userl) async {
    final json = jsonEncode(userl.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static UserlgetUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : Userl.fromJson(jsonDecode(json));
  }
}
