import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/estadisticas-api.dart';
import 'package:runningup/models/estadisticas.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';


class EstadisticaPage extends StatefulWidget {
  static String id = 'Estadistica_Page';
  @override
  _EstadisticaPageState createState() => _EstadisticaPageState();
}

class _EstadisticaPageState extends State<EstadisticaPage> {
  UserPreference userPreference = UserPreference();

  @override
 Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estadisticas'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Estadísticas"),
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
          future: fetchEstadisticas(userPreference.userIdDrawer),
          builder: (context, AsyncSnapshot<List<Estadisticas>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                 shrinkWrap: true,  physics: ClampingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  Estadisticas estadisticas = snapshot.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.emojiterra.com/mozilla/512px/1f3c3.png"),
                    ),
                    title: Text(
                        '${estadisticas.fecha}  ${estadisticas.tiempo}'), 
                    subtitle: Text('${estadisticas.userName}'),
                    
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
