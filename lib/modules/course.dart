import 'package:flutter/material.dart';

class Course with ChangeNotifier {
  final String id;
  final String name;
  final int numberLecture;
  final Duration timeLectures;
  bool isFavorite;
  bool isActive;
  final TypeCourse typeCourse;
  final Color cardColor;
  final String descrpition;
  Course(
      {this.isActive = false,
      this.isFavorite = false,
      required this.id,
      required this.descrpition,
      required this.cardColor,
      required this.name,
      required this.numberLecture,
      required this.timeLectures,
      required this.typeCourse});
}

enum TypeCourse {
  Programing,
  Finance,
  Language,
  Desing,
}
