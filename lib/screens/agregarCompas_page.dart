import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/screens/login_page.dart';
// import 'package:runningup/widgets/drawer.dart';

import 'package:runningup/widgets/navbar.dart';
import 'package:http/http.dart' as http;

import 'compas_page.dart';
class AgregarCompasPage extends StatefulWidget {
  static String id = 'AgregarCompa_Page';

  @override
  AddCompaPage createState() => AddCompaPage();
}

class AddCompaPage extends State<AgregarCompasPage> {
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerApellidoPaterno = new TextEditingController();
  TextEditingController controllerApellidoMaterno = new TextEditingController();
  TextEditingController controlleremailc = new TextEditingController();
  String registro = "Su cuenta ha sido creada";

  var _formkey = GlobalKey<FormState>();

void addData(){
   var url = Uri.parse("https://runningup.000webhostapp.com/agregarUser.php");

   http.post(url, body:{
     "Nombre" : controllerNombre.text,
     "Apellido_Paterno" : controllerApellidoPaterno.text,
     "Apellido_Materno" : controllerApellidoMaterno.text,
     "email_c" : controlleremailc.text,
   });
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
        title: Text('Registro de Compas'),
      ),
        backgroundColor: MaterialColors.bgColorScreen,
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget> [
                new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.email_outlined, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerNombre,
                        // ignore: missing_return
                        validator: (value) {
                          if(value.isEmpty) return "Ingrese un correo electronico";
                        },
                        decoration: new InputDecoration(
                          hintText: "Nombre", labelText: "Nombre",
                        ),
                      ),  
                       ),

                    new ListTile(
                      leading: const Icon(Icons.lock_open_outlined, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerApellidoPaterno,
                        // ignore: missing_return
                        validator: (value) {
                          if(value.isEmpty) return "Ingrese la contraseña";
                        },
                        decoration: new InputDecoration(
                          hintText: "Apellido Paterno", labelText: "Apellido Paterno",
                        ),
                      ),  
                       ),

                    new ListTile(
                      leading: const Icon(Icons.person, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerApellidoMaterno,
                        // ignore: missing_return
                        validator: (value) {
                          if(value.isEmpty) return "Campo nombre vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Apellido Materno", labelText: "Apellido Materno",
                        ),
                      ),  
                       ),

                      new ListTile(
                      leading: const Icon(Icons.person_outline, color: Colors.black,),
                      title: new TextFormField(
                        controller: controlleremailc,
                        // ignore: missing_return
                        validator: (value) {
                          if(value.isEmpty) return "Campo Primer Apellido vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Correo del Compa", labelText: "Correo del Compa",
                        ),
                      ),  
                       ),

                    const Divider(
                      height: 1.0,
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new ElevatedButton(
                      child: new Text("Registrarse"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: (){
                        if (_formkey.currentState.validate())
                        {
                          addData();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CompasPage()));
                          // Navigator.pop(context);
                        }
                      },
                    ) 


                  ],
                )
              ],
            ),
          ),
        )
        );
      
  
  }


}