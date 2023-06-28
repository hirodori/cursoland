import 'package:courseland/modules/course.dart';
//import 'package:courseland/modules/provider/course_maneger.dart';
import 'package:courseland/modules/provider/lista_de_COURSOS_AUX.dart';
import 'package:courseland/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:courseland/modules/user_preferences.dart';

class CoursesExplorer extends StatefulWidget {
  const CoursesExplorer({Key? key}) : super(key: key);

  @override
  State<CoursesExplorer> createState() => _CoursesExplorerState();
}

class _CoursesExplorerState extends State<CoursesExplorer> {
  late List<Course> _selectedCourses = [];

  @override
  void initState() {
    super.initState();
    _selectedCourses = DUMMY_COURSES;
  }

  void _runFilter(
    String enteredKeyword,
  ) {
    List<Course> results = [];

    results = DUMMY_COURSES
        .where((course) =>
            course.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
    // we use the toLowerCase() method to make it case-insensitive
    setState(() {
      _selectedCourses = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*var courses = Provider.of<CoursesManeger>(context);
    var coursesList = courses.courses;
    _selectedCourses = coursesList;*/
    var isDarkMode = UserPreferences.getDarkMode();

    if (isDarkMode == true) {
      return buildDarkScreen();
    } else {
      return buildWhiteScreen();
    }
  }

  Widget buildWhiteScreen() => Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Container(
              color: const Color.fromARGB(255, 100, 100, 100),
              width: double.infinity,
              height: 160,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'EXPLORER',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 40,
                            width: 300,
                            color: Colors.white,
                            child: TextField(
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                              ),
                              enableSuggestions: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 500,
              child: ListView.builder(
                itemCount: _selectedCourses.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: _selectedCourses[index],
                  child: CoursesCard(
                    course: _selectedCourses[index],
                  ),
                ),
              ),
            ),
          ),
        ]),
      );

  Widget buildDarkScreen() => Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Container(
              color: const Color.fromARGB(255, 100, 100, 100),
              width: double.infinity,
              height: 160,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'EXPLORER',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 40,
                            width: 300,
                            color: Colors.white,
                            child: TextField(
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                              ),
                              enableSuggestions: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 500,
              child: ListView.builder(
                itemCount: _selectedCourses.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: _selectedCourses[index],
                  child: CoursesCard(
                    course: _selectedCourses[index],
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
}
