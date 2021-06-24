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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registro de Actividad'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "RegisAct_Page"),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 15.0),
        ],
      ),
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
              leading: Icon(Icons.add_alert_rounded, color: Colors.blue),
              title: Text('Estas listo para comenzar'),
              subtitle: Text('Sigue las siguientes instrucciones:'),
            ),
            ListTile(
              subtitle: Text(
                  '1 - Busca el código  "QR" que se encuentra al inicio de recorrido. \n'),
            ),
            ListTile(
              subtitle: Text(
                  '2 - Presione el botón "Comenzar" posicionado al final. \n'),
            ),
            ListTile(
              subtitle: Text('3 - Escanea el código "QR". \n'),
            ),
            FadeInImage(
              image: AssetImage('assets/img/qr.jpg'),
              // image: NetworkImage(
              //     'http://www.eloriente.net/home/wp-content/uploads/2017/04/ESTADISTICA.jpg'),
              placeholder: AssetImage('assets/img/cargando.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250.0,
              fit: BoxFit.cover,
            ),
            ListTile(
             
              subtitle: Text('4 - El cronometro comenzará automáticamente. \n'),
            ),
            ListTile(
              subtitle: Text('5 - Para finalizar presiona "terminar" y escanea el código "QR" que se encuentra al final del recorrido. \n'),
            ),
            Row(  
              mainAxisAlignment: MainAxisAlignment.center,
                
              children: <Widget>[
                
                TextButton( 
                  
                  child: Text('Comenzar' ,style: TextStyle(color:Colors.white),),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    
                  
                  ),
                  onPressed: () => scanQr(),
                  
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
