import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:runningup/constants/Theme.dart';
import 'package:runningup/prefences/user_preference.dart';

import 'package:runningup/widgets/drawer-tile.dart';

class MaterialDrawer extends StatefulWidget {
  final String currentPage;

  MaterialDrawer({this.currentPage});

  @override
  _MaterialDrawerState createState() => _MaterialDrawerState();
}

class _MaterialDrawerState extends State<MaterialDrawer> {
  
  UserPreference userPreference = UserPreference();

  //el primer metodo que se ejecuta al inicar el widget
  @override
  void initState() { 
    super.initState();
    // se ejecuta cuando el widget esta cargado
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterLayout());
  }

  void _afterLayout() async {

    userPreference.initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(color: MaterialColors.drawerHeader),
            child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text(
                    userPreference.userName,
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Row(
                    children: [
                    
                    ],
                  ),
                )
              ],
            ))),
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (widget.currentPage != "Home")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: Colors.black,
                title: "Inicio",
                isSelected: widget.currentPage == "Home" ? true : false),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (widget.currentPage != "Perfil_Page")
                    Navigator.pushReplacementNamed(context, '/Perfil');
                },
                iconColor: Colors.black,
                title: "Perfil",
                isSelected: widget.currentPage == "Perfil_Page" ? true : false),
            DrawerTile(
                icon: Icons.run_circle_outlined,
                onTap: () {
                  if (widget.currentPage != "RegisAct_Page")
                    Navigator.pushReplacementNamed(context, '/RegisAct');
                },
                iconColor: Colors.black,
                title: "Registro de Actividades",
                isSelected: widget.currentPage == "RegisAct_Page" ? true : false),
            DrawerTile(
                icon: Icons.contact_page,
                onTap: () {
                  if (widget.currentPage != "Compas_Page")
                    Navigator.pushReplacementNamed(context, '/Compas');
                },
                iconColor: Colors.black,
                title: "Compas",
                isSelected: widget.currentPage == "Compas_Page" ? true : false),
            DrawerTile(
                icon: Icons.assistant_photo,
                onTap: () {
                  if (widget.currentPage != "Estadistica_Page")
                    Navigator.pushReplacementNamed(context, '/Estadisticas');
                },
                iconColor: Colors.black,
                title: "Estadisticas",
                isSelected: widget.currentPage == "Estadistica_Page" ? true : false),
            DrawerTile(
                icon: Icons.logout,
                onTap: () {
                  if (widget.currentPage != "")
                    Navigator.pushReplacementNamed(context, '/Login');
                },
                iconColor: Colors.black,
                title: "Cerrar Sesión",
                isSelected: widget.currentPage == "" ? true : false),
            // DrawerTile(
            //     icon: Icons.exit_to_app,
            //     onTap: () {
            //       if (currentPage != "Sign In")
            //         Navigator.pushReplacementNamed(context, '/signin');
            //     },
            //     iconColor: Colors.black,
            //     title: "Sign In",
            //     isSelected: currentPage == "Sign In" ? true : false),
            // DrawerTile(
            //     icon: Icons.open_in_browser,
            //     onTap: () {
            //       if (currentPage != "Sign Up")
            //         Navigator.pushReplacementNamed(context, '/signup');
            //     },
            //     iconColor: Colors.black,
            //     title: "Sign Up",
            //     isSelected: currentPage == "Sign Up" ? true : false),
          ],
        ))
      ])),
    );
  }
}
