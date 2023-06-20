import 'package:courseland/modules/user_preferences.dart';
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
    final image = user.imagePath.contains('https://')
        ? NetworkImage(user.imagePath)
        : FileImage(File(user.imagePath));
    var durationCourse = widget.course.timeLectures.inMinutes.toString();
    return Scaffold(
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
                        Navigator.pop(context);
                      }),
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    widget.course.name,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Container(
              //  width: 200,
              child: Image.network(
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
                  backgroundColor: Color.fromARGB(255, 169, 169, 169),
                  color: widget.course.cardColor,
                  value: 0.8,
                  minHeight: 30,
                ),
              ),
            ),
            Container(
              height: 350,
              child: ListView.builder(
                itemCount: widget.course.videoCourse.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: VideoTile(
                      allVideos: widget.course.videoCourse,
                      color: widget.course.cardColor,
                      indexVideo: index,
                      nameVideo: widget.course.videoCourse[index].nameVideo,
                      durationVideo: widget.course.videoCourse[index].duration,
                      seen: widget.course.videoCourse[index].seen),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
