import 'package:flutter/material.dart';

import '../modules/course.dart';

class CourseDatails extends StatelessWidget {
  static const routeName = 'Course-details';
  Course course;
  CourseDatails({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: course.cardColor,
            width: 200,
          )
        ],
      ),
    );
  }
}
