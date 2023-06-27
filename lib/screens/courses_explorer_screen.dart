import 'package:courseland/modules/course.dart';
import 'package:courseland/modules/provider/course_maneger.dart';
import 'package:courseland/modules/provider/lista_de_COURSOS_AUX.dart';
import 'package:courseland/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesExplorer extends StatefulWidget {
  const CoursesExplorer({Key? key}) : super(key: key);

  @override
  State<CoursesExplorer> createState() => _CoursesExplorerState();
}

class _CoursesExplorerState extends State<CoursesExplorer> {
  late List<Course> _selectedCourses = [];
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
    print(results);
    setState(() {
      _selectedCourses = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*var courses = Provider.of<CoursesManeger>(context);
    var coursesList = courses.courses;
    _selectedCourses = coursesList;*/
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Container(
            color: Color.fromARGB(255, 95, 95, 95),
            width: double.infinity,
            height: 160,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'EXPLORER',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 40,
                          width: 300,
                          color: Colors.white,
                          child: TextField(
                            onChanged: (value) {
                              _runFilter(value);
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
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
            margin: EdgeInsets.only(top: 10),
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
}
