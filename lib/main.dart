import 'package:flutter/material.dart';
import 'package:runningup/screens/RegistroAct_page.dart';
import 'package:runningup/screens/agregarCompas_page.dart';
import 'package:runningup/screens/buscarCompas_page.dart';
import 'package:runningup/screens/compas_page.dart';
import 'package:runningup/screens/crono_page.dart';
// import 'package:runningup/screens/crono_page.dart';
import 'package:runningup/screens/estadisticas_page.dart';

// screens
import 'package:runningup/screens/home.dart';
import 'package:runningup/screens/login_page.dart';
import 'package:runningup/screens/perfil_compas_page.dart';
import 'package:runningup/screens/perfil_page.dart';
import 'package:runningup/screens/register_page.dart';
// import 'package:runningup/screens/profile.dart';
import 'package:runningup/screens/salonfama_page.dart';
// import 'package:runningup/screens/settings.dart';
// import 'package:runningup/screens/components.dart';
// import 'package:runningup/screens/onboarding.dart';
// import 'package:runningup/screens/pro.dart';

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
          "/Estadisticas": (BuildContext context) => new EstadisticaPage(''),
          "/Logout": (BuildContext context) => new CompasPage(),
          "/Registro": (BuildContext context) => new RegisterPage(),
          "/Crono": (BuildContext context) => new CronoPage(),
          "/AddCompa": (BuildContext context) => new AgregarCompasPage(),
          "/SearchCompa": (BuildContext context) => new BuscarCompaPage(),
          "/perfilCompas": (BuildContext context) => new PerfilCompasPage(),



          "/Login": (context)=> LoginPage('')
        });
  }
}
