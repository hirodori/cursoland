// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class FocusMode extends StatefulWidget {
  const FocusMode({Key? key}) : super(key: key);

  @override
  State<FocusMode> createState() => _FocusModeState();
}

class _FocusModeState extends State<FocusMode> {
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
                isReverse: true,
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
                _controller.resume();
              });
            },
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
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
