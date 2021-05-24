import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;
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






          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,

          //   children: [
          //   SizedBox(
          //       height: 15.0,
          //     ),
          //   Text(
          //     'Hola este es tu registro de actividades papu ^_~',
          //     overflow: TextOverflow.ellipsis,
          //     style: const TextStyle(fontWeight: FontWeight.bold),
          //   ),
            
          //   SizedBox(
          //     height: 0.5,
          //   ),
          // ],

          // ),
          
        ) ,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () =>scanQr(),
            child: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        );
      
  
  }


}