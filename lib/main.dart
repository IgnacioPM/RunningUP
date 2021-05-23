import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/screens/perfil_page.dart';
import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/salonfama_page.dart';
import 'package:material_kit_flutter/screens/settings.dart';
import 'package:material_kit_flutter/screens/components.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';
import 'package:material_kit_flutter/screens/pro.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshoot) {
        if (snapshoot.hasError) {
          return ErrorWidget();
        } else if (snapshoot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        } else {
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

@override
Widget build(BuildContext context) {
  return MaterialApp(
      title: "Material Kit PRO Flutter",
      debugShowCheckedModeBanner: false,
      initialRoute: "/Login",
      routes: <String, WidgetBuilder>{
        "/Perfil": (context) => PerfilPage(),
        "/SalonFama": (context) => SalonFamaPage(),
        "/Login": (context) => LoginPage(),
        "/onboarding": (BuildContext context) => new Onboarding(),
        "/pro": (BuildContext context) => new Pro(),
        "/home": (BuildContext context) => new Home(),
        "/components": (BuildContext context) => new Components(),
        "/profile": (BuildContext context) => new Profile(),
        "/settings": (BuildContext context) => new Settings(),
      });
}
