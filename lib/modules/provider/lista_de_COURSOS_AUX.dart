import 'package:flutter/material.dart';

import '../course.dart';
import '../list_videos.dart';

final List<Course> DUMMY_COURSES = [
  Course(
      teacher: 'Kernel',
      videoCourse: webdesign,
      urlImage:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Fvetores-gratis%2Fprocesso-de-trabalho-de-web-design_1284-34411.jpg%3Fw%3D2000&tbnid=5N89vQqOyi4YwM&vet=12ahUKEwihttL6urH_AhUhlpUCHQyGDkIQMygNegUIARDjAQ..i&imgrefurl=https%3A%2F%2Fbr.freepik.com%2Fvetores-gratis%2Fprocesso-de-trabalho-de-web-design_9387225.htm&docid=mTBXS9nQATwXlM&w=2000&h=2000&q=imagens%20we%20design&ved=2ahUKEwihttL6urH_AhUhlpUCHQyGDkIQMygNegUIARDjAQ',
      descrpition: '',
      cardColor: Color.fromARGB(255, 193, 96, 27),
      id: 'c1',
      name: 'Web design',
      numberLecture: 10,
      timeLectures: Duration(hours: 15),
      typeCourse: TypeCourse.Desing),
  Course(
      teacher: 'Kernel',
      videoCourse: webdesign,
      urlImage:
          'https://www.webskittersacademy.in/wp-content/uploads/2016/01/Java-As-A-Programming-Language.png',
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
      urlImage:
          'https://miro.medium.com/v2/resize:fit:1400/1*ycIMlwgwicqlO6PcFRA-Iw.png',
      descrpition: '',
      cardColor: Colors.green.shade900,
      id: 'c3',
      name: 'Python',
      numberLecture: 15,
      timeLectures: Duration(hours: 15),
      typeCourse: TypeCourse.Programing),
  Course(
      teacher: 'Kernel',
      videoCourse: webdesign,
      urlImage:
          'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230304231205/C-Language2.png',
      descrpition: '',
      cardColor: Color.fromARGB(255, 89, 98, 201),
      id: 'c4',
      name: 'C++',
      numberLecture: 15,
      timeLectures: Duration(hours: 15),
      typeCourse: TypeCourse.Programing),
];
