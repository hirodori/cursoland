import 'package:flutter/material.dart';

class Course with ChangeNotifier {
  final String id; //ID do curso, sendo que cada um apresenta um próprio e único
  final String name; //Nome do curso
  final int numberLecture; //Número de aulas do curso
  final Duration timeLectures; //Tempo do curso em horas
  bool isFavorite; //Booleano se o curso está Favoritado
  bool isActive; //Booleano se o curso está Ativo
  final TypeCourse typeCourse; //Tipo do curso
  final Color cardColor; //Cor do card do curso
  final String descrpition; //Descrição do curso
  final String teacher; //Professor(a) do Curso

  Course(
      {this.isActive = false,
      this.isFavorite = false,
      required this.teacher,
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
