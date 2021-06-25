import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/user-api.dart';
import 'package:runningup/models/user.dart';
import 'package:runningup/widgets/drawer.dart';

class PerfilCompasPage extends StatefulWidget {
  @override
  _PerfilCompasPageState createState() => _PerfilCompasPageState();
}

class _PerfilCompasPageState extends State<PerfilCompasPage> {
  
  String emailC;
  Users compa = new Users();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    emailC = arguments['emailCompa'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perfil de compa'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Perfil_Page"),
      body: FutureBuilder(
        future: searchUsers(emailC),
        builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {

          if (!snapshot.hasData) {
            
            return CircularProgressIndicator();
          }

          compa = snapshot.data;

          return ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              SizedBox(height: 15.0),
              _cardTipo1(),
              SizedBox(height: 15.0),
              _cardTipo2(),
            ],
          );
        },
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          new ListTile(
            leading: const Icon(
              Icons.av_timer_outlined,
              color: Colors.black,
            ),
            title: new Text( 'Peso en kg: ' + compa.pesoKilos),
          ),
          SizedBox(
            height: 15.0,
          ),
          new ListTile(
            leading: const Icon(
              Icons.height_rounded,
              color: Colors.black,
            ),
            title: new Text('Altura en cm: ' + compa.alturaCentimetros),
          ),
          SizedBox(
            height: 15.0,
          ),
          new ListTile(
            leading: const Icon(
              Icons.accessibility_new,
              color: Colors.black,
            ),
            title: new Text(compa.sexo),
          ),
          SizedBox(
            height: 15.0,
          ),
          new ListTile(
            leading: const Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
            title: new Text(compa.email),
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage('assets/img/3100405.png'),
            // image: NetworkImage(
            //     'https://www.eliteonlinemedia.com/hubfs/Portada-Blogpost.jpg'),
            placeholder: AssetImage('assets/img/cargando.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 150.0,
            fit: BoxFit.cover,
          ),

          // Image(
          // image: NetworkImage('https://pbs.twimg.com/media/EphnIa2XMAM8lLm.jpg:large'),
          // ),
          Container(
            padding: EdgeInsets.all(7.0),
            child: Text(compa.name + ' ' + compa.ap1 + ' ' + compa.ap2),
          ),
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
                blurRadius: 20.0,
                spreadRadius: 4.0,
                offset: Offset(4.0, 7.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }
}
