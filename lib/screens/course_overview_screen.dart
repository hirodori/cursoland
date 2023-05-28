import 'package:courseland/modules/course.dart';
import 'package:courseland/modules/provider/activated_courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/provider/course_maneger.dart';

class CoursesOverviewScreen extends StatelessWidget {
  static const routeName = '/courses-details';
  const CoursesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String durationCourse;

    final courseId = ModalRoute.of(context)?.settings.arguments as String;
    var course = Provider.of<CoursesManeger>(context).findCourseById(courseId);
    var nome = Provider.of<CoursesManeger>(context).nome;

    durationCourse = course.timeLectures.inMinutes.toString();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.amber,
                  ),
                ),
                const Text(
                  'Course Info',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: course.cardColor,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                course.name,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
                maxLines: 2,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              infoCourse(
                icon: Icons.book,
                courseInfo: course.numberLecture.toString() + ' Lectures',
              ),
              infoCourse(
                courseInfo: durationCourse + ' min',
                icon: Icons.punch_clock,
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: course.cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(8),
                        color: Colors.black,
                        child: const Text(
                          'About the course',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 200,
                        padding: EdgeInsets.all(20),
                        color: Colors.black,
                        child: ListView(children: [
                          const Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry
                            . Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            s, when an unknown printer took a galley of type and scrambled it to make a 
                            type specimen book. It has survived not only five centuries, but also the l
                            eap into electronic typesetting, remaining essentially unchanged. It was popu
                            larised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                             passages, and more recently with desktop publishing software like Aldus PageMa
                             ker including versions of Lorem Ipsum.
                        
                        ''',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(
                          'ola'); //adicionar o curso na lista de cursos em andamento

                      /* CoursesActvated cA = CoursesActvated();
                      cA.courses.add(course);*/
                    },
                    child: Container(
                      width: 230,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'STAR\nLEARNING',
                            style: TextStyle(
                                color: course.cardColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CircleAvatar(
                            backgroundColor: course.cardColor,
                            radius: 30,
                            child: Icon(
                              Icons.play_arrow,
                              size: 40,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class infoCourse extends StatelessWidget {
  const infoCourse({
    Key? key,
    required this.icon,
    required this.courseInfo,
  }) : super(key: key);

  final String courseInfo;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 39, 39, 39),
            child: Icon(
              icon,
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$courseInfo',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      width: 135,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}