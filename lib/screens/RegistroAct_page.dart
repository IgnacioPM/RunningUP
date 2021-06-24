import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';

// import 'package:runningup/widgets/navbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:oktoast/oktoast.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
class RegisActPage extends StatefulWidget {
  static String id = 'RegisAct_Page';

  @override
  _RegisActPageState createState() => _RegisActPageState();
}

class _RegisActPageState extends State<RegisActPage> {
  String qrValue = "Codigo Qr";
  String msj = '';
   verificarpermisos_camara() async{
    var estatusCamara = await Permission.camera.status;
    var almacen = await Permission.storage.status;
    print(estatusCamara);
    print(almacen);
  //cameraStatus.isGranted == has access to application
    //cameraStatus.isDenied == does not have access to application, you can request again for the permission. 
    //cameraStatus.isPermanentlyDenied == does not have access to application, you cannot request again for the permission. 
    //cameraStatus.isRestricted == because of security/parental control you cannot use this permission. 
    //cameraStatus.isUndetermined == permission has not asked before. 
    if(!estatusCamara.isGranted)
      await Permission.camera.request();
    if(await Permission.camera.isGranted){
      scanQr();
    }else{
      showToast("Para leer el codigo QR por favor habilita el permiso del uso de camara", position: ToastPosition.bottom);
    }
    
  }



  void scanQr() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult;
    });
    if (qrValue == 'Iniciar') {
      Navigator.pushReplacementNamed(context, '/Crono');
    }else{
        setState(() {
      msj = 'El codigo QR no es valido, por favor verifique e intente de nuevo.';
    });
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
          onPressed: () => verificarpermisos_camara(),
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
