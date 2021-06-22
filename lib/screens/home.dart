// import 'dart:js';


import 'package:flutter/material.dart';

import 'package:runningup/constants/Theme.dart';

// import 'package:runningup/widgets/card-horizontal.dart';
// import 'package:runningup/widgets/card-small.dart';
// import 'package:runningup/widgets/card-square.dart';
import 'package:runningup/widgets/drawer.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Hardly Anything Takes More Coura...",
    "image":
        "https://images.unsplash.com/photo-1539314171919-908b0cd96f03?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  },
  "Makeup": {
    "title": "Find the cheapest deals on our range...",
    "image":
        "https://images.unsplash.com/photo-1515709980177-7a7d628c09ba?crop=entropy&w=840&h=840&fit=crop",
    "price": "220"
  },
  "Coffee": {
    "title": "Looking for Men's watches?",
    "image":
        "https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?crop=entropy&w=840&h=840&fit=crop",
    "price": "40"
  },
  "Fashion": {
    "title": "Curious Blossom Skin Care Kit.",
    "image":
        "https://images.unsplash.com/photo-1536303006682-2ee36ba49592?crop=entropy&w=840&h=840&fit=crop",
    "price": "188"
  },
  "Argon": {
    "title": "Adjust your watch to your outfit.",
    "image":
        "https://images.unsplash.com/photo-1491336477066-31156b5e4f35?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  }
};

class Home extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Inicio'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Home"),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 15.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo3(),
            SizedBox(height: 15.0),
            _cardTipo4(),
            SizedBox(height: 30.0),
            _cardTipo5(),
            SizedBox(height: 15.0),
            _cardTipo6(),
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

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage('assets/img/EphnIa2XMAM8lLm.jpg large.webp'),
            // image: NetworkImage(
            //     'https://pbs.twimg.com/media/EphnIa2XMAM8lLm.jpg:large'),
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
              child: Text('Empieza hoy a cambiar tu figura'))
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

  Widget _cardTipo3() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.addchart_rounded, color: Colors.blue),
              title: Text('Administra tus estadistica'),
              subtitle: Text(
                  'Mira lo mucho que as mejorado y presumele a tus amigos'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('ir'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Estadisticas');
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _cardTipo4() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage('assets/img/ESTADISTICA.webp'),
            // image: NetworkImage(
            //     'http://www.eloriente.net/home/wp-content/uploads/2017/04/ESTADISTICA.jpg'),
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
              child: Text(
                  'Con las estadisticas podras obtener un mejor informe de tus resultados'))
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

  Widget _cardTipo5() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assistant_photo_rounded, color: Colors.blue),
              title: Text('Salon de la fama'),
              subtitle: Text(
                  'Mantente en la cima con el puntaje mas alto y se la envidia de los demás'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('ir'),
                  onPressed: () {
                      Navigator.pushReplacementNamed(context, '/SalonFama');
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _cardTipo6() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage('assets/img/Portada-Blogpost.webp'),
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
              child: Text('Se el mejor entre los mejores'))
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
