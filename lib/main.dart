import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/screens/RegistroAct_page.dart';
import 'package:material_kit_flutter/screens/compas_page.dart';
import 'package:material_kit_flutter/screens/estadisticas_page.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/screens/perfil_page.dart';
// import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/salonfama_page.dart';
// import 'package:material_kit_flutter/screens/settings.dart';
// import 'package:material_kit_flutter/screens/components.dart';
// import 'package:material_kit_flutter/screens/onboarding.dart';
// import 'package:material_kit_flutter/screens/pro.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          /* if (snapshot.hasError) {
          return ErrorWidget();
        } else if (snapshot.hasData) { */
          return MaterialApp(
              title: "RunningUP",
              debugShowCheckedModeBanner: false,
              initialRoute: "/Login",
              routes: <String, WidgetBuilder>{
                "/home": (BuildContext context) => new Home(),
                "/Perfil": (context) => PerfilPage(),
                "/RegisAct": (BuildContext context) => new RegisActPage(),
                "/SalonFama": (context) => SalonFamaPage(),
                "/Compas": (BuildContext context) => new CompasPage(),
                "/Estadisticas": (BuildContext context) =>
                    new EstadisticaPage(),
                "/Logout": (BuildContext context) => new CompasPage(),
                "/Registro": (BuildContext context) => new CompasPage(),
                "/Login": (context) => LoginPage(),
              });
        } /* else {
          return Loading();
        }
      }, 
        );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [Icon(Icons.error), Text("Algo salió mal!")],
      ),
    ));
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
