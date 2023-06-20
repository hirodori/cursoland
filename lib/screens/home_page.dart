import 'package:courseland/screens/courses_explorer_screen.dart';
import 'package:courseland/screens/current_courses_screen.dart';
import 'package:courseland/screens/focus_mode_screen.dart';
import 'package:courseland/screens/reports.dart';
import 'package:courseland/screens/settings_screen.dart';
import 'package:flutter/material.dart';

/// Essa é a tela principal do aplicativo,onde é implementada a barra de navegação
/// para as demais telas.
/// E também possui um PageView para que usuario consiga trocar de tela ao arrastar para lado
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pc;
  int pageIndex = 0; //primeira pagina a ser mostrada
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(
        initialPage:
            pageIndex); //no momento da criação adionamos no PageController a pagina inicial
  }

  void _setCurrentPage(page) {
    //ao trocar de pagina o index da pagina atual é atulaizado, fazendo com que o icone selecionado também seja alterado
    setState(() {
      pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _setCurrentPage,
        controller: pc,
        children: [
          CoursesExplorer(),
          CurrentCoursesScreen(),
          FocusMode(),
          Reports(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        backgroundColor: Color.fromARGB(255, 152, 152, 152),
        selectedItemColor: Color.fromARGB(255, 255, 247, 0),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Focus'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded), label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (value) {
          //Ao clicar em determinado icone, uma animação simples ocorre pra que haja a troca das telas
          pc.animateToPage(value,
              duration: Duration(microseconds: 400), curve: Curves.ease);
        },
        currentIndex: pageIndex,
      ),
    );
  }
}
