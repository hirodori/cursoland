import 'package:courseland/modules/course.dart';
import 'package:courseland/screens/course_details.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final Course course;

  const ProgressCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetails(
                course: course,
              ),
            ));
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                      thickness: 3,
                      height: 50),
                  const Text(
                    'PROGRESSO',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.green,
                      value: course.watchedLeactures / course.numberLecture,
                      minHeight: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
