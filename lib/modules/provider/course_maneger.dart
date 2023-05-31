import 'package:courseland/modules/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesManeger with ChangeNotifier {
  String? nome;
  void changeNaME(String novoNome) {
    nome = novoNome;
    notifyListeners();
  }

  final List<Course> _courses = [
    Course(
        teacher: 'Kernel',
        descrpition: '',
        cardColor: Colors.green,
        id: 'c1',
        name: 'Web desing',
        numberLecture: 10,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Desing),
    Course(
        teacher: 'Kernel',
        descrpition: '',
        cardColor: Color.fromARGB(255, 211, 203, 38),
        id: 'c2',
        name: 'Java',
        numberLecture: 15,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Programing),
    Course(
        teacher: 'Kernel',
        descrpition: '',
        cardColor: Colors.green,
        id: 'c3',
        name: 'Python',
        numberLecture: 15,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Programing),
    Course(
        teacher: 'Kernel',
        descrpition: '',
        cardColor: Color.fromARGB(255, 89, 98, 201),
        id: 'c4',
        name: 'C++',
        numberLecture: 15,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Programing),
  ];
  List<Course> get courses {
    return [..._courses];
  }

  List<Course> get favorite {
    //return ever product that has favorite true
    return _courses.where((c) => c.isFavorite == true).toList();
  }

  List<Course> get filterByPrograming {
    //return ever product that has favorite true
    return _courses
        .where((c) => c.typeCourse == TypeCourse.Programing)
        .toList();
  }

  List<Course> get filterByDesing {
    //return ever product that has favorite true
    return _courses.where((c) => c.typeCourse == TypeCourse.Desing).toList();
  }

  Course findCourseById(String id) {
    return _courses.firstWhere((element) => element.id == id);
  }
}
