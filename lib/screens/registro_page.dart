import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
// import 'package:material_kit_flutter/widgets/drawer.dart';

// import 'package:material_kit_flutter/widgets/navbar.dart';
class RegisterPage extends StatefulWidget {
  static String id = 'Registro_Page';

  @override
  RegistroPage createState() => RegistroPage();
}

class RegistroPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registro'),
          // transparent: true,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // drawer: MaterialDrawer(currentPage:"Registro_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola este es el formulario de resgitro de cuentas papu ^_~'
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