import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';
import 'package:runningup/prefences/user_preference.dart';

// import 'package:runningup/widgets/navbar.dart';
class PerfilPage extends StatefulWidget {
  static String id = 'Perfil_Page';

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Mi Perfil'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Perfil_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.0,
              ),
              new ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: new Text(userPreference.userNameDrawer +
                    ' ' +
                    userPreference.userAp1Drawer +
                    ' ' +
                    userPreference.userAp2Drawer),
              ),
              SizedBox(
                height: 0.5,
              ),
            ],
          ),
        ));
  }
}
