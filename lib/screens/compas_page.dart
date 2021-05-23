import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
class CompasPage extends StatefulWidget {
  static String id = 'Compas_Page';

  @override
  _CompasPageState createState() => _CompasPageState();
}

class _CompasPageState extends State<CompasPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Compas",
          transparent: true,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"Compas_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola esta es tu lista de contactus papu ^_~'
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