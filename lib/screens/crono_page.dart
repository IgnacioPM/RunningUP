import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:runningup/constants/Theme.dart';
// import 'package:runningup/widgets/drawer.dart';
import 'package:qrscan/qrscan.dart' as scanner;

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
  String _stopwatchText = '00:00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(milliseconds: 1);
  String qrValue = "Codigo Qr";
  String xd ='';


void scanQr() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult;
    });
    // if (cameraScanResult.length > 0) {
    //         Navigator.pushReplacementNamed(context, '/Crono');
    //       }
    if(qrValue == 'Finalizar'){

      _stopWatch.stop();
      xd = _stopwatchText;
    //  Navigator.pushReplacementNamed(context, '/Estadisticas');

    }
    
  }


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
        // _stopWatch.stop();
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
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMilliseconds % 60).toString().padLeft(2, '0');
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
            'assets/img/tumblr_ab724334c896fee8abeb7e948fe53e03_1ac9e543_400.gif',
            height: 370.0,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              _stopwatchText,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Text(xd, style: TextStyle(fontSize: 25.0, color: Colors.red)),
              ElevatedButton(
                child: Icon( Icons.play_arrow),
                onPressed: _startStopButtonPressed,
              ),
              // ignore: deprecated_member_use
              ElevatedButton.icon(
                label: Text('Detener actividad') ,
                icon: Icon(Icons.stop_rounded) ,
                onPressed: () => scanQr(),
                
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
