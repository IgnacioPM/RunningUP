import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
class RegisActPage extends StatefulWidget {
  static String id = 'RegisAct_Page';

  @override
  _RegisActPageState createState() => _RegisActPageState();
}

class _RegisActPageState extends State<RegisActPage> {
  @override
  Widget build(BuildContext context) {
    var fontweight;
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Perfil",
          transparent: true,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"RegisAct_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola este es tu registro de actividades papu ^_~',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            
            SizedBox(
              height: 0.5,
            ),
          ],

          ),
          
        ) 
        );
      
  
  }


}