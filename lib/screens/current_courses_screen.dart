import 'package:courseland/screens/courses_explorer_screen.dart';
import 'package:flutter/material.dart';

/// Tela onde os cursos em andamentos sãomostrados com uma barra de progresso
/// e tb possui filtros para a pesquisa de seus cursos
class CurrentCoursesScreen extends StatelessWidget {
  CurrentCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
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
        )
      ]),
    );
  }
}
