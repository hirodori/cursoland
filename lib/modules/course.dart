import 'package:courseland/modules/video.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
  final String urlImage; //endereço de uma imagem
  late List<Video> videoCourse; //videos que serão usados por cada curso
  int watchedLeactures;
  Course(
      {this.isActive = false,
      required this.urlImage,
      this.watchedLeactures = 0,
      required this.videoCourse,
      this.isFavorite = false,
      required this.teacher,
      required this.id,
      required this.descrpition,
      required this.cardColor,
      required this.name,
      required this.numberLecture,
      required this.timeLectures,
      required this.typeCourse});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> videoCourseJson =
        videoCourse.map((video) => video.toJson()).toList();

    return {
      'id': id,
      'name': name,
      'numberLecture': numberLecture,
      'timeLectures': timeLectures.inHours,
      'isFavorite': isFavorite,
      'isActive': isActive,
      'typeCourse': typeCourse.toString(),
      'cardColor': cardColor.toString(),
      'description': descrpition,
      'teacher': teacher,
      'urlImage': urlImage,
      'videoCourse': videoCourseJson,
      'watchedLeactures': watchedLeactures,
    };
  }

  void updateLeacture() {
    this.watchedLeactures++;
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    String colorValue = json['cardColor']
        .toString()
        .replaceAll("Color(0x", "")
        .replaceAll(")", "");
    int colorInt = int.parse(colorValue, radix: 16);
    return Course(
      id: json['id'],
      name: json['name'],
      numberLecture: json['numberLecture'],
      timeLectures: Duration(hours: json['timeLectures']),
      isFavorite: json['isFavorite'],
      isActive: json['isActive'],
      typeCourse: TypeCourse.Desing,
      cardColor: Color(colorInt),
      descrpition: json['description'],
      teacher: json['teacher'],
      urlImage: json['urlImage'],
      watchedLeactures: json['watchedLeactures'],
      videoCourse: List<Video>.from(
          json['videoCourse'].map((videoJson) => Video.fromJson(videoJson))),
    );
  }
  void updateVideo(int index, List<Video> vd) {
    this.videoCourse[index].seen = true;
  }
}

enum TypeCourse {
  Programing,
  Finance,
  Language,
  Desing,
}
