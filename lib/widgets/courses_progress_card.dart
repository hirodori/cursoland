import 'package:courseland/modules/course.dart';
import 'package:courseland/modules/provider/activated_courses.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final Course course;

  const ProgressCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Color.fromARGB(255, 255, 85, 0),
      margin: EdgeInsets.all(15),
      color: course.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 200,
        width: 10,
        child: Column(
          children: [
            Text(
              course.name,
              style: TextStyle(color: Colors.white, fontSize: 41),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.green,
                    value: 0.8,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  "80 %",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 41,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.green,
                    value: 0.8,
                    minHeight: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
