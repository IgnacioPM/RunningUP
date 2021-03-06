import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/estadisticas-api.dart';
import 'package:runningup/models/estadisticas.dart';
import 'package:runningup/models/user-api.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';

class SalonFamaPage extends StatefulWidget {
  static String id = 'SalonFama_Page';

  @override
  _SalonFamaPageState createState() => _SalonFamaPageState();
}

class _SalonFamaPageState extends State<SalonFamaPage> {
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        title: Text('Salon de la Fama'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Salon de la Fama"),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: FutureBuilder(
        future: fetchFama(),
        builder: (context, AsyncSnapshot<List<Estadisticas>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                Estadisticas estadisticas = snapshot.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.emojiall.com/images/animations/joypixels/128px/trophy.gif"),
                  ),
                  title: Text(
                  '${estadisticas.fecha}  ${estadisticas.tiempo}'), 
                  subtitle: Text('${estadisticas.userName}'),
                  // if (estadisticas.recorridoIdrecorrido == userPreference.userIdDrawer){
              

                  // },
                );
              },
            );
          }

          return LinearProgressIndicator();
        },
      ),
    );
  }
}
