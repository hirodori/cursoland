import 'package:flutter/material.dart';

class Userl {
  final String imagePath;
  final String name;
  final String email;
  final bool isDarkMode;

  const Userl({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.isDarkMode,
  });

  Userl copy({
    String? imagePath,
    String? name,
    String? email,
    String? password,
    bool? isDarkTheme,
  }) =>
      Userl(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        isDarkMode: isDarkTheme ?? this.isDarkMode,
      );

  static Userl fromJson(Map<String, dynamic> json) => Userl(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'isDarkMode': isDarkMode,
      };
}
