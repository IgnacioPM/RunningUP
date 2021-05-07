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
    return MaterialApp(
        title: "Material Kit PRO Flutter",
        debugShowCheckedModeBanner: false,
        initialRoute: "/Login",
        routes: <String, WidgetBuilder>{
          "/Perfil": (context)=> PerfilPage(),
          "/SalonFama": (context)=> SalonFamaPage(),
          "/Login": (context)=> LoginPage(),
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/pro": (BuildContext context) => new Pro(),
          "/home": (BuildContext context) => new Home(),
          "/components": (BuildContext context) => new Components(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new Settings(),
        });
  }
}
