import 'package:courseland/modules/video.dart';
import 'package:flutter/material.dart';

/**[VideoTile] é uma widget que mostra as informações de cada curso, e também ao ser pressionada 
 * direciona o usuário a tela onde o video será reproduzido
 * Possui também uma check box que é alterada caso a aula seja assitida
 */
class VideoTile extends StatefulWidget {
  final Color color;
  final String nameVideo;
  final Duration durationVideo;
  bool seen;
  final List<Video> allVideos;
  final int indexVideo;
  VideoTile(
      {Key? key,
      required this.color,
      required this.nameVideo,
      required this.durationVideo,
      required this.seen,
      required this.allVideos,
      required this.indexVideo})
      : super(key: key);

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 0, 0, 0);
      }
      return const Color.fromARGB(255, 0, 0, 0);
    }

    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Row(
          children: [
            Checkbox(
              checkColor: const Color.fromARGB(255, 0, 255, 123),
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: widget.seen,
              onChanged: (bool? value) {},
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: IconButton(
                    padding: const EdgeInsets.all(3),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.nameVideo,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.access_time_sharp, color: Colors.white, size: 20),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.durationVideo.inMinutes.toString() + ' min',
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ]),
    );
  }
}
