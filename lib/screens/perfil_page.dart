import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';
import 'package:runningup/prefences/user_preference.dart';

// import 'package:runningup/widgets/navbar.dart';
class PerfilPage extends StatefulWidget {
  static String id = 'Perfil_Page';

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Mi Perfil'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Perfil_Page"),
        body: ListView(
          padding: EdgeInsets.all(10.0),
            children: <Widget> [
               SizedBox(height: 15.0),
              _cardTipo1(),
                SizedBox(height: 15.0),
              _cardTipo2(), 
              
            ],
          ),
        );
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
                 
              SizedBox(
                height: 15.0,
              ),

               new ListTile(
                leading: const Icon(
                  Icons.av_timer_outlined,
                  color: Colors.black,
                ),
                
                title: new Text( 'Peso en kg: '+ userPreference.userPesoKilosDrawer),
                
              ),

               SizedBox(
                height: 15.0,
              ),

                new ListTile(
                leading: const Icon(
                  Icons.height_rounded,
                  color: Colors.black,
                ),
                
                title: new Text('Altura en cm: '+userPreference.userAlturaCentimetrosDrawer),
                
              ),

               SizedBox(
                height: 15.0,
              ),

                  new ListTile(
                leading: const Icon(
                  Icons.accessibility_new,
                  color: Colors.black,
                ),
                
                title: new Text(userPreference.userSexoDrawer),
                
              ),

               SizedBox(
                height: 15.0,
              ),

                    new ListTile(
                leading: const Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
                
                title: new Text(userPreference.useremailDrawer),
                
              ),
              
              
          ],
        ),
      );
    });
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
              child: Text(userPreference.userNameDrawer +
                    ' ' +
                    userPreference.userAp1Drawer +
                    ' ' +
                    userPreference.userAp2Drawer))
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
