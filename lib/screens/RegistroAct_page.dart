import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:stop_watch_timer/stop_watch_timer.dart';
class RegisActPage extends StatefulWidget {
  static String id = 'RegisAct_Page';

  @override
  _RegisActPageState createState() => _RegisActPageState();
}

class _RegisActPageState extends State<RegisActPage> {
String qrValue = "COdigo Qr";

  void scanQr() async{
    String cameraScanResult = await scanner.scan();
    setState(() {
    qrValue= cameraScanResult;
      
    });
  }
final StopWatchTimer _stopWatchTimer = StopWatchTimer();
final _isHours = true;

@override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
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
            child: Text(
              qrValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                ),
            ),
          ),
          
        ) ,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () =>scanQr(),
            child: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        // cronofloatingActionButton: FloatingActionButton(
        //     backgroundColor: Colors.green[900],
        //     onPressed: (),
        //     child: Icon(
        //       Icons.camera_alt_outlined,
        //     ),
        //   ),

        );
      
  
  }


}