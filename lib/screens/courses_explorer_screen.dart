import 'package:courseland/modules/provider/course_maneger.dart';
import 'package:courseland/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesExplorer extends StatelessWidget {
  const CoursesExplorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var courses = Provider.of<CoursesManeger>(context);
    var coursesList = courses.courses;
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
                    'COURSES',
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
                          child: TextFormField(
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
              itemCount: coursesList.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: coursesList[index],
                child: CoursesCard(
                  course: coursesList[index],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
