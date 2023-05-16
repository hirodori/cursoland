import 'package:courseland/modules/course.dart';
import 'package:courseland/screens/course_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/provider/course_maneger.dart';

class CoursesCard extends StatelessWidget {
  final Course course;
  final Color backgroundColor;
  const CoursesCard({
    Key? key,
    required this.course,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var courses = Provider.of<Course>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CoursesOverviewScreen.routeName, arguments: course.id);
      },
      child: Card(
        margin: EdgeInsets.all(15),
        elevation: 20,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 300,
          width: 10,
          child: Column(
            children: [
              Text(
                course.name,
                style: TextStyle(color: Colors.white, fontSize: 41),
              )
            ],
          ),
        ),
      ),
    );
  }
}
