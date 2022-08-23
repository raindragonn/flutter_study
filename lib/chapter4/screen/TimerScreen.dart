import 'dart:async';

import 'package:Flutter_Study/chapter4/data/TimerStatus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sprintf/sprintf.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const WORK_SECONDS = 5;
  static const REST_SECONDS = 2;

  late TimerStatus _timerStatus;
  late int _timer;
  late int _pomodoroCount;

  @override
  void initState() {
    _timerStatus = TimerStatus.stopped;
    print(_timerStatus.toString());
    _timer = WORK_SECONDS;
    _pomodoroCount = 0;
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("[=> ] ${_timerStatus.toString()}");
  }

  void run() {
    setState(() {
      _timerStatus = TimerStatus.running;
      runTimer();
    });
  }

  void reset() {
    setState(() {
      _timer = REST_SECONDS;
      _timerStatus = TimerStatus.resetting;
    });
  }

  void resume() {
    run();
  }

  void stop() {
    setState(() {
      _timer = WORK_SECONDS;
      _timerStatus = TimerStatus.stopped;
    });
  }

  void pause() {
    setState(() {
      _timerStatus = TimerStatus.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _runningButtons = [
      ElevatedButton(
        onPressed: _timerStatus == TimerStatus.paused ? resume : pause,
        child: Text(
          _timerStatus == TimerStatus.paused ? '계속하기' : '일시정지',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(20),
      ),
      ElevatedButton(
        onPressed: stop,
        child: Text(
          '포기하기',
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.grey),
      )
    ];

    final List<Widget> _stoppedButtons = [
      ElevatedButton(
        onPressed: run,
        child: Text(
          '시작하기',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          primary: _timerStatus == TimerStatus.resetting
              ? Colors.green
              : Colors.blue,
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('뽀모도로 타이머'),
        backgroundColor:
            _timerStatus == TimerStatus.resetting ? Colors.green : Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: context.getHeightRatio(0.5),
                width: context.getWidthRatio(0.6),
                child: Center(
                  child: Text(
                    secondsToString(_timer),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _timerStatus == TimerStatus.resetting
                      ? Colors.green
                      : Colors.blue,
                ),
              ),
            ),
            Visibility(
              visible: _timerStatus != TimerStatus.resetting,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _timerStatus == TimerStatus.stopped
                    ? _stoppedButtons
                    : _runningButtons,
              ),
            )
          ],
        ),
      ),
    );
  }

  void runTimer() {
    Timer(Duration.zero, () => print("check"));
    Timer.periodic(Duration(seconds: 1), (timer) {
      switch (_timerStatus) {
        case TimerStatus.paused:
          timer.cancel();
          break;
        case TimerStatus.stopped:
          timer.cancel();
          break;
        case TimerStatus.running:
          if (_timer <= 0) {
            showToast("작업 완료!");
            reset();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        case TimerStatus.resetting:
          if (_timer <= 0) {
            setState(() {
              _pomodoroCount += 1;
            });
            showToast("오늘 $_pomodoroCount개의 뽀모도로를 달성했습니다.");
            timer.cancel();
            stop();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
      }
    });
  }
}

String secondsToString(int seconds) {
  return sprintf("%02d:%02d", [seconds ~/ 60, seconds % 60]);
}

void showToast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16);
}

extension BuildContextExt on BuildContext {
  double getHeightRatio(double ratio) {
    return MediaQuery.of(this).size.height * ratio;
  }

  double getWidthRatio(double ratio) {
    return MediaQuery.of(this).size.width * ratio;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getWidth() {
    return MediaQuery.of(this).size.width;
  }
}

// extension BuildContextExt on BuildContext {
//   double getHeight() {
//     return MediaQuery.of(this).size.height;
//   }
// }
