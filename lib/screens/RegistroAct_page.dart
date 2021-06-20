import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

// import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:stop_watch_timer/stop_watch_timer.dart';
class RegisActPage extends StatefulWidget {
  static String id = 'RegisAct_Page';

  @override
  _RegisActPageState createState() => _RegisActPageState();
}

class _RegisActPageState extends State<RegisActPage> {
String qrValue = "Codigo Qr";

  void scanQr() async{
    String cameraScanResult = await scanner.scan();
    setState(() {
    qrValue= cameraScanResult;
      
    });
    if (cameraScanResult.length > 0) {
            Navigator.pushReplacementNamed(context, '/Crono');
          }
  }


  @override
  Widget build(BuildContext context) {
    // var fontweight;
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registro de Actividad'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"RegisAct_Page"),
        body: Center(
          child: Container(
            // child: Text(
            //   qrValue,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 18,
            //     ),
            // ),
          ),
          
          
        ) ,
        floatingActionButton: _crearBotones()
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
      
  
  }

Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () =>scanQr(),
            child: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        SizedBox(width: 5.0),
        
      ],
    );
  }
  

}