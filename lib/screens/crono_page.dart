import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:runningup/constants/Theme.dart';
// import 'package:runningup/widgets/drawer.dart';
import 'package:http/http.dart' as http;

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';

import 'estadisticas_page.dart';

// ignore: must_be_immutable
class CronoPage extends StatefulWidget {
  static String id = 'crono_page';
  @override
  _CronoPageState createState() => _CronoPageState();
}

class _CronoPageState extends State<CronoPage> {
  UserPreference userPreference = UserPreference();
  TextEditingController controllerTiempo = new TextEditingController();
  TextEditingController controllerFecha = new TextEditingController();

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
  String xd = '';
  String msj = '';
  // DateTime fecha = DateTime.now();
  String fecha = '';
  int id = 1;

  void scanQr() async {
    String cameraScanResult = await scanner.scan();

    setState(() {
      qrValue = cameraScanResult;
    });

    // if (cameraScanResult.length > 0) {
    //         Navigator.pushReplacementNamed(context, '/Crono');
    //       }
    if (qrValue == 'Finalizar') {
      _stopWatch.stop();
      xd = _stopwatchText;
      fecha = DateTime.now().toString();

      // addData();
      // controllerTiempo.text = xd;
      // controllerFecha.text = fecha;

      print('xd xd xd');
      print(xd);
      print(fecha.substring(0, 19));
      print(userPreference.userIdDrawer);

      var url =
          Uri.parse("https://runningup.000webhostapp.com/Addtiempo_reco.php");
      http.post(url, body: {
        "tiempo": xd,
        "Fecha": fecha.substring(0, 19),
        "recorrido_idrecorrido": "1",
        "user_iduser": userPreference.userIdDrawer
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EstadisticaPage()));
    } else {
      setState(() {
        msj = 'Codigo QR erroneo';
      });
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

  // void _resetButtonPressed() {
  //   if (_stopWatch.isRunning) {
  //     _startStopButtonPressed();
  //   }
  //   setState(() {
  //     _stopWatch.reset();
  //     _setStopwatchText();
  //   });
  // }

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
        centerTitle: true,
        title: Text('Cronometro'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Crono"),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Flexible(
          child: Image.asset(
            'assets/img/rayman_running.gif',
            height: 370.0,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              _stopwatchText,
              style: TextStyle(fontSize: 60),
            ),
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Text(msj,
                  style:
                      TextStyle(fontSize: 25.0, color: Colors.redAccent[700])),
              ElevatedButton.icon(
                label: Text('Detener actividad'),
                icon: Icon(Icons.stop_rounded),
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
  Widget _cardTipo1() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.accessibility_new, color: Colors.blue),
              title: Text('Bienvenido a Running App'),
              subtitle:
                  Text('El app que a revolucionado el control de tus rutinas'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Comenzar'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/RegisAct');
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }



}
