import 'dart:io';

//import 'package:courseland/modules/course.dart';
//import 'package:courseland/modules/provider/activated_courses.dart';
import 'package:courseland/screens/course_details.dart';
import 'package:courseland/modules/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/provider/course_maneger.dart';

class CoursesOverviewScreen extends StatefulWidget {
  static const routeName = '/courses-Overview';
  const CoursesOverviewScreen({Key? key}) : super(key: key);

  @override
  State<CoursesOverviewScreen> createState() => _CoursesOverviewScreenState();
}

class _CoursesOverviewScreenState extends State<CoursesOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    String durationCourse;

    final courseId = ModalRoute.of(context)?.settings.arguments as String;
    var courseProvider = Provider.of<CoursesManeger>(context);
    var course = courseProvider.findCourseById(courseId);

    durationCourse = course.timeLectures.inMinutes.toString();

    final user = UserPreferences.getUser();
    final image = user.imagePath.contains('https://')
        ? NetworkImage(user.imagePath)
        : FileImage(File(user.imagePath));

    var isDarkMode = UserPreferences.getDarkMode();

    if (isDarkMode == true) {
      return buildDarkScreen(
          durationCourse, courseId, courseProvider, course, user, image);
    } else {
      return buildWhiteScreen(
          durationCourse, courseId, courseProvider, course, user, image);
    }
  }

  Widget buildDarkScreen(
    String durationCourse,
    final courseId,
    var courseProvider,
    var course,
    final user,
    final image,
  ) =>
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.amber,
                    ),
                  ),
                  const Text(
                    'COURSE INFO',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        image: image as ImageProvider,
                        fit: BoxFit.cover,
                        width: 64,
                        height: 64,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                    color: Color.fromARGB(255, 255, 255, 255),
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
                      borderRadius: const BorderRadius.only(
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
                          padding: const EdgeInsets.all(8),
                          color: Colors.black,
                          child: const Text(
                            'About the course',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 255, 255, 255),
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
                          padding: const EdgeInsets.all(20),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          child: ListView(
                            children: const [
                              Text(
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
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        //     ourses.where((c) => c.isActive == true).toList();
                        var COURSES = await UserPreferences.loadCourses();
                        try {
                          //verifica se existe o curso na lista
                          var auxCourse = COURSES
                              .firstWhere((element) => element.id == courseId);
                        } catch (e) {
                          var isPremium = UserPreferences.getPremium();
                          //    if (ele for premium || (ele não for premium && cursos < 1))
                          if (isPremium == true ||
                              ((isPremium == null || isPremium == false) &&
                                  COURSES.length == 0)) {
                            courseProvider.ActivateCourse(courseId);
                            var courseToBeActivated =
                                courseProvider.courses.firstWhere(
                              (element) => element.id == courseId,
                            );

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CourseDetails(course: course),
                                ));
                            print(e);
                          }
                        }

                        //adicionar o curso na lista de cursos em andamento

                        /* CoursesActvated cA = CoursesActvated();
                      cA.courses.add(course);*/
                      },
                      child: Container(
                        width: 230,
                        height: 80,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'START\nLEARNING',
                              style: TextStyle(
                                  color: course.cardColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            CircleAvatar(
                              backgroundColor: course.cardColor,
                              radius: 30,
                              child: const Icon(
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

  Widget buildWhiteScreen(
    String durationCourse,
    final courseId,
    var courseProvider,
    var course,
    final user,
    final image,
  ) =>
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.amber,
                    ),
                  ),
                  const Text(
                    'COURSE INFO',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        image: image as ImageProvider,
                        fit: BoxFit.cover,
                        width: 64,
                        height: 64,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                    color: Color.fromARGB(255, 0, 0, 0),
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
                      borderRadius: const BorderRadius.only(
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
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: const Text(
                            'About the course',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 0, 0, 0),
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
                          padding: const EdgeInsets.all(20),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: ListView(
                            children: const [
                              Text(
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
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        //     ourses.where((c) => c.isActive == true).toList();
                        var COURSES = await UserPreferences.loadCourses();
                        try {
                          //verifica se existe o curso na lista
                          var auxCourse = COURSES
                              .firstWhere((element) => element.id == courseId);
                        } catch (e) {
                          var isPremium = UserPreferences.getPremium();
                          //    if (ele for premium || (ele não for premium && cursos < 1))
                          if (isPremium == true ||
                              ((isPremium == null || isPremium == false) &&
                                  COURSES.length == 0)) {
                            courseProvider.ActivateCourse(courseId);
                            var courseToBeActivated =
                                courseProvider.courses.firstWhere(
                              (element) => element.id == courseId,
                            );

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CourseDetails(course: course),
                                ));
                            print(e);
                          }
                        }

                        //adicionar o curso na lista de cursos em andamento

                        /* CoursesActvated cA = CoursesActvated();
                      cA.courses.add(course);*/
                      },
                      child: Container(
                        width: 230,
                        height: 80,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'START\nLEARNING',
                              style: TextStyle(
                                  color: course.cardColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            CircleAvatar(
                              backgroundColor: course.cardColor,
                              radius: 30,
                              child: const Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Color.fromARGB(255, 255, 255, 255),
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

class infoCourse extends StatefulWidget {
  const infoCourse({
    Key? key,
    required this.icon,
    required this.courseInfo,
  }) : super(key: key);

  final String courseInfo;
  final IconData icon;

  @override
  State<infoCourse> createState() => _infoCourseState();
}

class _infoCourseState extends State<infoCourse> {
  var isDarkMode = UserPreferences.getDarkMode();

  @override
  Widget build(BuildContext context) {
    if (isDarkMode == true) {
      return buildWhiteInfo();
    } else {
      return buildDarkInfo();
    }
  }

  Widget buildDarkInfo() => Container(
        margin: const EdgeInsets.all(10),
        width: 135,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 39, 39, 39),
              child: Icon(
                widget.icon,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${widget.courseInfo}',
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )
          ],
        ),
      );

  Widget buildWhiteInfo() => Container(
        margin: const EdgeInsets.all(10),
        width: 135,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 39, 39, 39),
              child: Icon(
                widget.icon,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${widget.courseInfo}',
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )
          ],
        ),
      );
}
