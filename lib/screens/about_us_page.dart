// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';

import 'package:runningup/widgets/drawer.dart';




class AboutPage extends StatefulWidget {
  static String id = 'About_Page';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sobre RunningUp'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "About"),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
           _cardTipo1(),
           SizedBox(height: 15.0),
            _cardTipo2(),
            SizedBox(height: 15.0),
             _cardTipo3()
          ],
        ));
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
              leading: Icon(Icons.run_circle_outlined, color: Colors.blue),
              title: Text('RunningUp'),
             
            ),
   
          ],
        ),
      );
    });
  }
  Widget _cardTipo2() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            
            ListTile(
              
             
              subtitle:
                  Text(' \nSomos un grupo de estudiantes de la Universidad Nacional de Costa Rica, cursando la carrera ingeniería en sistemas, este App fue realizada con el propósito de fomentar la importancia de la realización de actividades al aire libre, ya que actualmente las personas son muy sedentarias y han olvidado la importancia y los beneficios de la realización de estas actividades.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('volver a inicio'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }
  Widget _cardTipo3() {

    final card = Container(
      child: Column(
        
        children: <Widget>[
          Container(
                 padding: EdgeInsets.all(10.0),
              child: Text('')
          ),
          FadeInImage(
            
            image: AssetImage('assets/img/logo.png'),
            // image: NetworkImage(
            //     'https://www.eliteonlinemedia.com/hubfs/Portada-Blogpost.jpg'),
            placeholder: AssetImage('assets/img/cargando.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),

          // Image(
          // image: NetworkImage('https://pbs.twimg.com/media/EphnIa2XMAM8lLm.jpg:large'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(''))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          //color: Colors.black26
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }

}
