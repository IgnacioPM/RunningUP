import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:material_kit_flutter/constants/Theme.dart';
// import 'package:material_kit_flutter/widgets/drawer.dart';

// ignore: must_be_immutable
class CronoPage extends StatefulWidget {
  static String id = 'crono_page';
  @override
  _CronoPageState createState() => _CronoPageState();
}

class _CronoPageState extends State<CronoPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _startStopButtonPressed());
  }

  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText() {
    _stopwatchText = _stopWatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronometro'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Flexible(
          child: Image.asset(
            'assets/img/logo.png',
            height: 370.0,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              _stopwatchText,
              style: TextStyle(fontSize: 72),
            ),
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Icon(_isStart ? Icons.play_arrow : Icons.stop),
                onPressed: _startStopButtonPressed,
              ),
              // ignore: deprecated_member_use
              ElevatedButton(
                child: Text('Reset'),
                onPressed: _resetButtonPressed,
              ),
              ElevatedButton(
                child: Icon(
                  Icons.arrow_back_sharp,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/RegisAct');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
