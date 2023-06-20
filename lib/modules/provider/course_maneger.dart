import 'package:courseland/modules/course.dart';
import 'package:courseland/modules/list_videos.dart';
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
        videoCourse: webdesign,
        descrpition: '',
        urlImage: '',
        cardColor: Color.fromARGB(255, 204, 41, 41),
        id: 'c1',
        name: 'Web desing',
        numberLecture: 10,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Desing),
    Course(
        teacher: 'Kernel',
        videoCourse: webdesign,
        urlImage: '',
        descrpition: '',
        cardColor: Color.fromARGB(255, 211, 203, 38),
        id: 'c2',
        name: 'Java',
        numberLecture: 15,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Programing),
    Course(
        teacher: 'Kernel',
        videoCourse: webdesign,
        urlImage: '',
        descrpition: '',
        cardColor: Colors.green,
        id: 'c3',
        name: 'Python',
        numberLecture: 15,
        timeLectures: Duration(hours: 15),
        typeCourse: TypeCourse.Programing),
    Course(
        teacher: 'Kernel',
        videoCourse: webdesign,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Fvetores-gratis%2Fprocesso-de-trabalho-de-web-design_1284-34411.jpg%3Fw%3D2000&tbnid=5N89vQqOyi4YwM&vet=12ahUKEwihttL6urH_AhUhlpUCHQyGDkIQMygNegUIARDjAQ..i&imgrefurl=https%3A%2F%2Fbr.freepik.com%2Fvetores-gratis%2Fprocesso-de-trabalho-de-web-design_9387225.htm&docid=mTBXS9nQATwXlM&w=2000&h=2000&q=imagens%20we%20design&ved=2ahUKEwihttL6urH_AhUhlpUCHQyGDkIQMygNegUIARDjAQ',
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

  List<Course> get activated {
    //return ever product that has active true
    return _courses.where((c) => c.isActive == true).toList();
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

  void ActivateCourse(String id) {
    //Encontrar o id do curso a ser ativado e
    //logo em seguida mudar o atributo do curso.id para true
    //e notificar o listener q esta na tela current curses
    _courses.firstWhere((element) => element.id == id).isActive = true;
    notifyListeners();
  }
}
