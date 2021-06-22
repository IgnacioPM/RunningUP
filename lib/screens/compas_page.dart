import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';

import 'package:runningup/widgets/navbar.dart';
class CompasPage extends StatefulWidget {
  static String id = 'Compas_Page';

  @override
  _CompasPageState createState() => _CompasPageState();
}

class _CompasPageState extends State<CompasPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Compas'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"Compas_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola esta es tu lista de contactus papu ^_~'
            ),
            
            SizedBox(
              height: 0.5,
            ),
          ],

          ),
          
        ) ,
         floatingActionButton: _crearBotones()
        );
  }

   Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () {    Navigator.pushReplacementNamed(context, '/AddCompa');
},
            child: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        SizedBox(width: 5.0),
        
      ],
    );
  }


}