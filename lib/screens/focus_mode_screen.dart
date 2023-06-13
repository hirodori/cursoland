// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';

/**Mostra um timer que pode ter seu tempo definido conforme os pre-sets.
 * Com ele o usuário escolhe um tempo para estudar.
 * E com isso caso a pessoa tente mexer no celular, o programa identifica se ouve movimento
 * e mostra uma mensagem de alerta
 * 
 */
class FocusMode extends StatefulWidget {
  const FocusMode({Key? key}) : super(key: key);

  @override
  State<FocusMode> createState() => _FocusModeState();
}

class _FocusModeState extends State<FocusMode> {
  late ShakeDetector detector;
  @override
  void initState() {
    super.initState();
    bool flag = true;
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        /*  print('x' + event.x.toString());
        print('z' + event.z.toString());
        print('y' + event.y.toString());*/

        if ((event.x > 0.5 || event.y > 0.5 || event.z > 0.5) && flag) {
          flag = false;
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      flag = true;
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ],
              title: Text('FOCO'),
              content: const Text('MANTENHA O FOCO'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  CountDownController _controller = CountDownController();
  bool _isPause = false;
  int timer = 2;
  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (() {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: ListWheelScrollView(
                      onSelectedItemChanged: (value) {
                        timer = value;
                        setState(() {});
                      },
                      controller: controller,
                      itemExtent: 50,
                      children: List.generate(
                        24,
                        (index) => Text(index.toString(),
                            style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  );
                },
              );
            }),
            child: Center(
              child: CircularCountDownTimer(
                autoStart: false,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: timer,
                fillColor: Colors.amber,
                controller: _controller,
                backgroundColor: Colors.white54,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverse: false,
                onComplete: () {
                  //mudar a mensagem e o estilo do dialog
                  //  _dialogBuilder(context);
                },
                textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
                ringColor: Colors.red,
              ),
            ),
          ),
          MaterialButton(
            child: Icon(_isPause ? Icons.play_arrow : Icons.pause),
            onPressed: () {
              setState(() {
                if (_isPause) {
                  _isPause = false;

                  _controller.resume();
                } else {
                  _isPause = true;
                  _controller.pause();
                }
                _controller.start();
              });
            },
            color: Colors.amber,
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            child: Text('Reset'),
            color: Colors.orange,
            onPressed: () {
              setState(() {
                _controller.reset();
              });
            },
          )
        ],
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 100,
        width: 100,
        color: Colors.green,
        child: Text('choose'),
      );
      /*AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text(
          'A dialog is a type of modal window that\n'
          'appears in front of app content to\n'
          'provide critical information, or prompt\n'
          'for a decision to be made.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );*/
    },
  );
}
