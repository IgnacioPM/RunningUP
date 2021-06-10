import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
// import 'package:material_kit_flutter/widgets/drawer.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:http/http.dart' as http;
class RegisterPage extends StatefulWidget {
  static String id = 'Registro_Page';

  @override
  RegistroPage createState() => RegistroPage();
}

class RegistroPage extends State<RegisterPage> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerAp1 = new TextEditingController();
  TextEditingController controllerAP2 = new TextEditingController();
  String registro = "Su cuenta ha sido creada";

  var _formkey = GlobalKey<FormState>();

void addData(){
   var url = Uri.parse("https://runningup.000webhostapp.com/register.php");

   http.post(url, body:{
     "email" : controllerEmail.text,
     "password" : controllerPassword.text,
     "name" : controllerName.text,
     "ap1" : controllerAp1.text,
     "ap2" : controllerAP2.text,

   });
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
        title: Text('Registro de Usuario'),
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
                        controller: controllerEmail,
                        validator: (value) {
                          if(value.isEmpty) return "Ingrese un correo electronico";
                        },
                        decoration: new InputDecoration(
                          hintText: "email", labelText: "correo",
                        ),
                      ),  
                       ),

                    new ListTile(
                      leading: const Icon(Icons.lock_open_outlined, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerPassword,
                        validator: (value) {
                          if(value.isEmpty) return "Ingrese la contraseña";
                        },
                        decoration: new InputDecoration(
                          hintText: "password", labelText: "contraseña",
                        ),
                      ),  
                       ),

                    new ListTile(
                      leading: const Icon(Icons.person, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerName,
                        validator: (value) {
                          if(value.isEmpty) return "Campo nombre vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "name", labelText: "Nombre",
                        ),
                      ),  
                       ),

                      new ListTile(
                      leading: const Icon(Icons.person_outline, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerAp1,
                        validator: (value) {
                          if(value.isEmpty) return "Campo Primer Apellido vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "ap1", labelText: "Primer Apellido",
                        ),
                      ),  
                       ),

                      new ListTile(
                      leading: const Icon(Icons.person_outline, color: Colors.black,),
                      title: new TextFormField(
                        controller: controllerAP2,
                        validator: (value) {
                          if(value.isEmpty) return "Campo Segundo Apellido vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "ap2", labelText: "Segundo Apellido",
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(registro)));
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