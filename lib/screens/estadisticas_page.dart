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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estadisticas'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Estadísticas"),
      body: Center(
        child: FutureBuilder(
          future: fetchEstadisticas(userPreference.userIdDrawer),
          builder: (context, AsyncSnapshot<List<Estadisticas>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Estadisticas estadisticas = snapshot.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1553544923-37efbe6ff816?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=368&q=80"),
                    ),
                    title: Text(
                        '${estadisticas.fecha}'),
                    subtitle: Text('${estadisticas.recorridoIdrecorrido}'),
                  );
                },
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
