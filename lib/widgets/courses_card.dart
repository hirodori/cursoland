import 'package:courseland/modules/course.dart';
import 'package:courseland/screens/course_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        /// if(course.id)
        Navigator.of(context)
            .pushNamed(CoursesOverviewScreen.routeName, arguments: course.id);
      },
      child: Card(
        elevation: 20,
        shadowColor: const Color.fromARGB(255, 255, 85, 0),
        margin: const EdgeInsets.all(15),
        color: course.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          width: 10,
          child: Column(
            children: [
              Text(
                course.name,
                style: const TextStyle(color: Colors.white, fontSize: 41),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoCourse(
                    icon: Icons.book,
                    courseInfo: course.numberLecture.toString() + ' Lectures',
                  ),
                  infoCourse(
                    courseInfo:
                        course.timeLectures.inMinutes.toString() + ' min',
                    icon: Icons.punch_clock,
                  ),
                ],
              ),
              Text("Teacher: " + course.teacher,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
