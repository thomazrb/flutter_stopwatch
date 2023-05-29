import 'dart:async';
import 'package:flutter/material.dart';

class MyStopwatch extends StatefulWidget {
  final String title;
  final int minutes;
  final int seconds;
  const MyStopwatch(
      {super.key, required this.title, this.minutes = 2, this.seconds = 0});

  @override
  State<MyStopwatch> createState() => _MyStopwatchState();
}

class _MyStopwatchState extends State<MyStopwatch> {
  late Timer clockTick;
  bool isRunning = false;
  late int minutes;
  late int seconds;

  @override
  void initState() {
    super.initState();
    seconds = widget.seconds;
    minutes = widget.minutes;
  }

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      clockTick = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          seconds--;
          if (seconds < 0) {
            seconds = 59;
            minutes--;
            if (minutes < 0) {
              minutes = 0;
              seconds = 0;
              clockTick.cancel();
              isRunning = false;
            }
          }
        });
      });
    }
  }

  void stopTimer() {
    if (isRunning) {
      isRunning = false;
      clockTick.cancel();
    }
  }

  void resetTimer() {
    setState(() {
      minutes = widget.minutes;
      seconds = widget.seconds;
      if (isRunning) {
        stopTimer();
        startTimer();
      }
    });
  }

  @override
  void dispose() {
    if (isRunning) {
      clockTick.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(widget.title),
        Text(
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: startTimer, child: const Icon(Icons.play_arrow)),
            InkWell(onTap: stopTimer, child: const Icon(Icons.stop)),
            InkWell(onTap: resetTimer, child: const Icon(Icons.restart_alt)),
          ],
        )
      ]),
    );
  }
}
