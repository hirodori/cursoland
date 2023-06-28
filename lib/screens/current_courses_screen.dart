//import 'package:courseland/modules/provider/course_maneger.dart';
import 'package:courseland/modules/user_preferences.dart';
import 'package:courseland/widgets/courses_progress_card.dart';
//import 'package:courseland/screens/courses_explorer_screen.dart';
//import 'package:courseland/widgets/courses_card.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import '../modules/course.dart';

/// Tela onde os cursos em andamentos sãomostrados com uma barra de progresso
/// e tb possui filtros para a pesquisa de seus cursos
class CurrentCoursesScreen extends StatelessWidget {
  const CurrentCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var courses = Provider.of<CoursesManeger>(context);

    //final coursesList = UserPreferences.loadCourses();

    var isDarkMode = UserPreferences.getDarkMode();

    if (isDarkMode == true) {
      return buildDarkScreen();
    } else {
      return buildWhiteScreen();
    }
  }

  Widget buildDarkScreen() => Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Column(children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(50)),
            child: Container(
              height: 150,
              color: Colors.amber,
              width: 400,
              child: const SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'MY COURSES',
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 500,
                child: /*ListView.builder(
              itemCount: coursesList.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: coursesList[index],
                child: ProgressCard(
                  course: coursesList[index],
                ),
              ),
            ),*/
                    FutureBuilder<List<Course>>(
                  future: fetchCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao carregar os cursos'),
                      );
                    } else if (snapshot.hasData) {
                      List<Course> coursesList = snapshot.data!;
                      return ListView.builder(
                        itemCount: coursesList.length,
                        itemBuilder: (context, index) => ProgressCard(
                          course: coursesList[index],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Nenhum curso encontrado'),
                      );
                    }
                  },
                )),
          ),
        ]),
      );

  Widget buildWhiteScreen() => Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(50)),
            child: Container(
              height: 150,
              color: Colors.amber,
              width: 400,
              child: const SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'MY COURSES',
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 500,
                child: /*ListView.builder(
              itemCount: coursesList.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: coursesList[index],
                child: ProgressCard(
                  course: coursesList[index],
                ),
              ),
            ),*/
                    FutureBuilder<List<Course>>(
                  future: fetchCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao carregar os cursos'),
                      );
                    } else if (snapshot.hasData) {
                      List<Course> coursesList = snapshot.data!;
                      return ListView.builder(
                        itemCount: coursesList.length,
                        itemBuilder: (context, index) => ProgressCard(
                          course: coursesList[index],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Nenhum curso encontrado'),
                      );
                    }
                  },
                )),
          ),
        ]),
      );

  Future<List<Course>> fetchCourses() async {
    // Simulando uma função assíncrona que busca a lista de cursos

    return await UserPreferences
        .loadCourses(); // Função que você implementou para carregar os cursos
  }
}
