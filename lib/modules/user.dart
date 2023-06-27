import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LocalUser {
  //final String id;
  final String imagePath;
  final String name;
  final String email;
  final bool isDarkMode;

  const LocalUser({
    //required this.id,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.isDarkMode,
  });

  LocalUser copy({
    //String? id,
    String? imagePath,
    String? name,
    String? email,
    bool? isDarkTheme,
  }) =>
      LocalUser(
        //id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static LocalUser fromJson(Map<String, dynamic> json) => LocalUser(
        //id: json['id'],
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        //'id': id,
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'isDarkMode': isDarkMode,
      };
}
