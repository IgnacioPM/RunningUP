import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
// import 'package:runningup/widgets/drawer.dart';

import 'package:http/http.dart' as http;
import 'package:runningup/prefences/user_preference.dart';

import 'compas_page.dart';
class AgregarCompasPage extends StatefulWidget {
  static String id = 'AgregarCompa_Page';

  @override
  AddCompaPageState createState() => AddCompaPageState();
}

class AddCompaPageState extends State<AgregarCompasPage> {
  UserPreference userPreference = UserPreference();
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerApellidoPaterno = new TextEditingController();
  TextEditingController controllerApellidoMaterno = new TextEditingController();
  TextEditingController controlleremailc = new TextEditingController();
  String registro = "Su cuenta ha sido creada";

  var _formkey = GlobalKey<FormState>();

void addData(){
 print('xd xd xd');
 print(userPreference.userIdDrawer);
 
   var url = Uri.parse("https://runningup.000webhostapp.com/agregarCompa.php");

   http.post(url, body:{
     "Nombre" : controllerNombre.text,
     "Apellido_Paterno" : controllerApellidoPaterno.text,
     "Apellido_Materno" : controllerApellidoMaterno.text,
     "email_c" : controlleremailc.text,
     "idUser" : userPreference.userIdDrawer

   });
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
        title: Text(userPreference.userIdDrawer),
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
                        validator: (value) {
                          if(value.isEmpty) return "Ingrese la contrase??a";
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