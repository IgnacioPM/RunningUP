import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';

// import 'package:runningup/widgets/navbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;

// import 'package:stop_watch_timer/stop_watch_timer.dart';
class RegisActPage extends StatefulWidget {
  static String id = 'RegisAct_Page';

  @override
  _RegisActPageState createState() => _RegisActPageState();
}

class _RegisActPageState extends State<RegisActPage> {
  String qrValue = "Codigo Qr";
  String msj = '';

  void scanQr() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult;
    });
    // if (cameraScanResult.length > 0) {
    //         Navigator.pushReplacementNamed(context, '/Crono');
    //       }
    if (qrValue == 'Iniciar') {
      Navigator.pushReplacementNamed(context, '/Crono');
    }else{
        setState(() {
      msj = 'El codigo QR no es valido, por favor verifique e intente de nuevo.';
    });
      // final snackBar = SnackBar(content: Text(msj));
    }
  }

  @override
  Widget build(BuildContext context) {
    // var fontweight;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registro de Actividad'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "RegisAct_Page"),
        body: Center(
          child: Container(
              // child: Text(
              //   qrValue,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18,
              //     ),
              // ),
              child: Text(msj, style: TextStyle(fontSize: 25.0, color: Colors.red)),
              
              ),
        ),
        floatingActionButton: _crearBotones(),
        
        //   floatingActionButton: FloatingActionButton(
        //     backgroundColor: Colors.green[900],
        //     onPressed: () =>scanQr(),
        //     child: Icon(
        //       Icons.camera_alt_outlined,
        //     ),
        //   ),
        // _cronofloatingActionButton: FloatingActionButton(
        //     backgroundColor: Colors.red[400],
        //     onPressed: () {
        //       Navigator.pushReplacementNamed(context, '/');
        //     },
        //     child: Icon(
        //       Icons.play_circle_fill
        //     ),
        //   ),
          
        );
        // ignore: dead_code
        // Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
          backgroundColor: Colors.green[900],
          onPressed: () => scanQr(),
          child: Icon(
            Icons.camera_alt_outlined,
          ),
        ),
        SizedBox(width: 5.0),
      ],
    );
  }
  // Widget _alerta(){
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {


  // });
  // }
}
