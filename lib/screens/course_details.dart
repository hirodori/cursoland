import 'package:courseland/screens/video_player.dart';
import 'package:courseland/modules/user_preferences.dart';
import 'package:courseland/screens/home_page.dart';
import 'package:courseland/widgets/ads_page.dart';
import 'package:courseland/widgets/video_tile.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../modules/course.dart';
import 'course_overview_screen.dart';

/**[CourseDetails] direciona o usuário a tela que mostra todas as aulas anexadas ao curso
 * Ele também carrega uma imagem que está linkada ao courso
 * E mostra o progresso pelo curso
 */
class CourseDetails extends StatefulWidget {
  static const routeName = 'Course-details';
  Course course;

  CourseDetails({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    int attendedClasses = widget.course.watchedLeactures;
    final c = UserPreferences.loadCourses();
    final image = user.imagePath.contains('https://')
        ? NetworkImage(user.imagePath)
        : FileImage(File(user.imagePath));
    var durationCourse = widget.course.timeLectures.inMinutes.toString();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
          icon: const Icon(
            Icons.unsubscribe,
            color: Colors.purple,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar')),
                  TextButton(
                      onPressed: () {
                        UserPreferences.removeCourse(widget.course);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(pageIndex: 0),
                            ));
                      },
                      child: const Text('Confirmar')),
                ],
                title: const Text('DESINSCRIÇÃO'),
                content: const Text(
                    'VOCÊ REALMENTE DESEJA SE DESINSCREVER DESSE CURSO?'),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(pageIndex: 1),
                            ));
                      }),
                      icon: Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    widget.course.name,
                    style: const TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  /*CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                  )*/
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              //  width: 200,
              child: Image.network(
                //pegar a imagem para cada curso
                'https://storage.googleapis.com/webdesignledger.pub.network/WDL/73df7ed4-webdesignledger_featured_tools-resources.png',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCourse(
                  icon: Icons.book,
                  courseInfo:
                      widget.course.numberLecture.toString() + ' Lectures',
                ),
                infoCourse(
                  courseInfo: durationCourse + ' min',
                  icon: Icons.punch_clock,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: LinearProgressIndicator(
                  backgroundColor: const Color.fromARGB(255, 169, 169, 169),
                  color: widget.course.cardColor,
                  value: widget.course.watchedLeactures /
                      widget.course.numberLecture,
                  minHeight: 30,
                ),
              ),
            ),
            scrollVIdeos()
          ],
        ),
      ),
    );
  }

  Container scrollVIdeos() {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: widget.course.videoCourse.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: GestureDetector(
            onTap: () async {
              var isPremium = UserPreferences.getPremium();
              if (isPremium == null || isPremium == false) {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ads(),
                    ));
              }
              setState(() {
                //ESSA É UMA SOLUÇÃO FACIL
                //POREM NAO MUITO CORRETA, O CERTO SERIA USAR PROVIDER

                widget.course.videoCourse[index].checkVideo();
                widget.course.updateLeacture();
                widget.course.updateVideo(index, widget.course.videoCourse);
                UserPreferences.updateCourse(widget.course);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayer(
                          url: widget.course.videoCourse[index].url),
                    ));
              });
            },
            child: VideoTile(
                allVideos: widget.course.videoCourse,
                color: widget.course.cardColor,
                indexVideo: index,
                nameVideo: widget.course.videoCourse[index].nameVideo,
                durationVideo: widget.course.videoCourse[index].duration,
                seen: widget.course.videoCourse[index].seen),
          ),
        ),
      ),
    );
  }
}
