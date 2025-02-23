import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talentei/utils/general_color.dart';

class TimerCounter extends StatefulWidget {
  const TimerCounter({super.key});

  @override
  State<TimerCounter> createState() => _TimerCounterState();
}

class _TimerCounterState extends State<TimerCounter> {
  int _seconds = 145; // 02:25 in seconds

  Timer? _timer;

  bool _isRunning = false;

  void _startTimer() {
    if (!_isRunning) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _timer?.cancel();
            _isRunning = false;
          }
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  // void _stopTimer() {
  //   _timer?.cancel();
  //   setState(() {
  //     _isRunning = false;
  //   });
  // }
  //
  // void _resetTimer() {
  //   _timer?.cancel();
  //   setState(() {
  //     _seconds = 145; // Reset to 02:25
  //     _isRunning = false;
  //   });
  // }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(
        _formatTime(_seconds),
        style: TextStyle(
            color: GeneralColor.greyBorderColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
      );
}
