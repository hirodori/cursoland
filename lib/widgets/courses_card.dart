import 'package:courseland/modules/course.dart';
import 'package:courseland/screens/course_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/provider/course_maneger.dart';

class CoursesCard extends StatelessWidget {
  //duração e quantidade de aulas

  final Course course;

  const CoursesCard({
    Key? key,
    required this.course,
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
        elevation: 20,
        shadowColor: Color.fromARGB(255, 255, 85, 0),
        margin: EdgeInsets.all(15),
        color: course.cardColor,
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
