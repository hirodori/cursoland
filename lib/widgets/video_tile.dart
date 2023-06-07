import 'package:flutter/material.dart';

/**[VideoTile] é uma widget que mostra as informações de cada curso, e também ao ser pressionada 
 * direciona o usuário a tela onde o video será reproduzido
 * Possui também uma check box que é alterada caso a aula seja assitida
 */
class VideoTile extends StatelessWidget {
  final Color color;
  final String nameVideo;
  final Duration durationVideo;
  final bool seen;
  VideoTile(
      {Key? key,
      required this.color,
      required this.nameVideo,
      required this.durationVideo,
      required this.seen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromARGB(255, 255, 255, 255);
      }
      return Color.fromARGB(255, 255, 255, 255);
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: seen,
                onChanged: (bool? value) {},
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                      )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  nameVideo,
                  style: TextStyle(
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
              Icon(Icons.access_time_sharp, color: Colors.white, size: 20),
              SizedBox(
                width: 10,
              ),
              Text(
                durationVideo.inMinutes.toString() + ' min',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
