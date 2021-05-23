import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
class EstadisticaPage extends StatefulWidget {
  static String id = 'Estadistica_Page';

  @override
  _EstadisticaPageState createState() => _EstadisticaPageState();
}

class _EstadisticaPageState extends State<EstadisticaPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Estadisticas",
          transparent: true,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"Estadistica_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola estas son tus esatdisticas papu ^_~'
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