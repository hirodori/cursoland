import 'package:courseland/modules/provider/course_maneger.dart';
import 'package:courseland/widgets/courses_progress_card.dart';
import 'package:courseland/screens/courses_explorer_screen.dart';
import 'package:courseland/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Tela onde os cursos em andamentos sãomostrados com uma barra de progresso
/// e tb possui filtros para a pesquisa de seus cursos
class CurrentCoursesScreen extends StatelessWidget {
  CurrentCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var courses = Provider.of<CoursesManeger>(context);
    var coursesList = courses.courses;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
          child: Container(
            height: 200,
            color: Colors.grey,
            width: 400,
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'My Courses',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            )),
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
                child: ProgressCard(
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
