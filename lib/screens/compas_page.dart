import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/compas-api.dart';
import 'package:runningup/models/compas.dart';
import 'package:runningup/models/user-api.dart';
import 'package:runningup/models/user.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';

import 'package:runningup/widgets/navbar.dart';

class CompasPage extends StatefulWidget {
  static String id = 'Compas_Page';

  @override
  _CompasPageState createState() => _CompasPageState();
}

class _CompasPageState extends State<CompasPage> {
  UserPreference userPreference = UserPreference();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setStateVacio());
  }

  void setStateVacio() {
    userPreference.userName = '';
    userPreference.userApe1 = '';
    userPreference.userApe2 = '';
    userPreference.userEmail = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Compas'),
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Compas_Page"),
      body: Center(
        child: FutureBuilder(
          future: fetchCompas(),
          builder: (context, AsyncSnapshot<List<Compas>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Compas users = snapshot.data[index];
                  return ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/Perfil');
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1553544923-37efbe6ff816?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=368&q=80"),
                    ),
                    title: Text(
                        '${users.nombre} ${users.apellidoPaterno} ${users.apellidoMaterno}'),
                    subtitle: Text('${users.emailC}'),
                  );
                },
              );
            }

            return CircularProgressIndicator();
          },
          // children: [
          //   SizedBox(
          //     height: 15.0,
          //   ),
          //   _nameTextField(),
          //   SizedBox(
          //     height: 15.0,
          //   ),
          //   _apellido1TextField(),
          //   SizedBox(
          //     height: 20.0,
          //   ),
          //   _bottonBuscar(),
          //   SizedBox(
          //     height: 15.0,
          //   ),
          //   Text(msg, style: TextStyle(fontSize: 25.0, color: Colors.red)),
          //   // Text(widget.registro,
          //   //     style: TextStyle(fontSize: 25.0, color: Colors.green)),
          // ],
        ),
      ),
      floatingActionButton: _buscarCompa(),
    );
  }

//    Widget _crearBotones() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         SizedBox(width: 30),
//         FloatingActionButton(
//             backgroundColor: Colors.green[900],
//             onPressed: () {    Navigator.pushReplacementNamed(context, '/AddCompa');
// },
//             child: Icon(
//               Icons.camera_alt_outlined,
//             ),
//           ),
//         SizedBox(width: 5.0),

//       ],
//     );
//   }

  Widget _buscarCompa() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
          backgroundColor: Colors.green[900],
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/SearchCompa');
          },
          child: Icon(
            Icons.search_rounded,
          ),
        ),
        SizedBox(width: 5.0),
      ],
    );
  }
}
