import 'dart:convert';

import 'package:courseland/modules/course.dart';
import 'package:courseland/modules/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const _keyCourses = 'courses';
  static const _premium = 'premium';
  static const _darkMode = 'darkMode';
  static const myUser = LocalUser(
    imagePath:
        'https://i.pinimg.com/564x/c5/9e/42/c59e4220f5710c277cfd9d0f137b13f5.jpg',
    name: '',
    email: '',
  );

  static Future<List<Course>> loadCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? coursesJson = prefs.getStringList(_keyCourses);
    List<Course> courses = [];

    if (coursesJson != null) {
      courses = coursesJson.map((c) => Course.fromJson(jsonDecode(c))).toList();
    }

    return courses;
  }

  static saveCourses(List<Course> courses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> coursesJson =
        courses.map((c) => jsonEncode(c.toJson())).toList();
    await prefs.setStringList(_keyCourses, coursesJson);
  }

  static Future<void> setCourses(Course c) async {
    List<Course> courses = await loadCourses();
    courses.add(c);
    saveCourses(courses);
  }

  static Future<void> updateCourse(Course updatedCourse) async {
    List<Course> courses = await loadCourses();

    // Encontre o índice do curso a ser atualizado
    int index = courses.indexWhere((course) => course.id == updatedCourse.id);

    if (index != -1) {
      // Atualize o curso na lista
      courses[index] = updatedCourse;
      await saveCourses(courses);
    }
  }

  static Future<void> removeCourse(Course courseToRemove) async {
    List<Course> courses = await loadCourses();

    // Remova o curso da lista
    courses.removeWhere((course) => course.id == courseToRemove.id);

    // Salve a lista atualizada de cursos
    await saveCourses(courses);
  }

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

  static Future setPremium(bool value) async {
    await _preferences.setBool(_premium, value);
  }

  static bool? getPremium() {
    return _preferences.getBool(_premium);
  }

  static Future setDarkMode(bool value) async {
    await _preferences.setBool(_darkMode, value);
  }

  static bool? getDarkMode() {
    return _preferences.getBool(_darkMode);
  }
}
