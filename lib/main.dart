import 'package:flutter/material.dart';
import 'package:material_kit_flutter/screens/RegistroAct_page.dart';
import 'package:material_kit_flutter/screens/compas_page.dart';
import 'package:material_kit_flutter/screens/crono_page.dart';
// import 'package:material_kit_flutter/screens/crono_page.dart';
import 'package:material_kit_flutter/screens/estadisticas_page.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/screens/perfil_page.dart';
import 'package:material_kit_flutter/screens/register_page.dart';
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
    return MaterialApp(
        title: "RunningUp",
        debugShowCheckedModeBanner: false,
        initialRoute: "/Login",
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => new Home(),
          "/Perfil": (context)=> PerfilPage(),
          "/RegisAct": (BuildContext context) => new RegisActPage(),
          "/SalonFama": (context)=> SalonFamaPage(),
          "/Compas": (BuildContext context) => new CompasPage(),
          "/Estadisticas": (BuildContext context) => new EstadisticaPage(),
          "/Logout": (BuildContext context) => new CompasPage(),
          "/Registro": (BuildContext context) => new RegisterPage(),
          "/Crono": (BuildContext context) => new CronoPage(),

          "/Login": (context)=> LoginPage('')
        });
  }
}
