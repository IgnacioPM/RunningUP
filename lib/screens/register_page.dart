import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/screens/login_page.dart';
// import 'package:runningup/widgets/drawer.dart';

import 'package:http/http.dart' as http;
import 'package:runningup/widgets/drawer.dart';

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
  TextEditingController controllerPeso = new TextEditingController();
  TextEditingController controllerAltura = new TextEditingController();
  TextEditingController controllerSexo = new TextEditingController();

  String registro = "Su cuenta ha sido creada";

  var _formkey = GlobalKey<FormState>();

  void addData() {
    var url = Uri.parse("https://runningup.000webhostapp.com/register.php");

    http.post(url, body: {
      "email": controllerEmail.text,
      "password": controllerPassword.text,
      "name": controllerName.text,
      "ap1": controllerAp1.text,
      "ap2": controllerAP2.text,
      "Peso_Kilos": controllerPeso.text,
      "Altura_Centimetros": controllerAltura.text,
      "Sexo": controllerSexo.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "AgregarCompa_Page"),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerEmail,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Ingrese un correo electronico";
                        },
                        decoration: new InputDecoration(
                          hintText: "email",
                          labelText: "correo",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.lock_open_outlined,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerPassword,
                        validator: (value) {
                          if (value.isEmpty) return "Ingrese la contraseña";
                        },
                        decoration: new InputDecoration(
                          hintText: "password",
                          labelText: "contraseña",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerName,
                        validator: (value) {
                          if (value.isEmpty) return "Campo nombre vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: Juan",
                          labelText: "Nombre",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerAp1,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Campo Primer Apellido vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: Perez",
                          labelText: "Primer Apellido",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerAP2,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Campo Segundo Apellido vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: Martinez",
                          labelText: "Segundo Apellido",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerPeso,
                        validator: (value) {
                          if (value.isEmpty) return "Campo Peso vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: 70",
                          labelText: "Peso en kilos",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerAltura,
                        validator: (value) {
                          if (value.isEmpty) return "Campo ALtura vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: 165",
                          labelText: "ALtura en centimetros",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      title: new TextFormField(
                        controller: controllerSexo,
                        validator: (value) {
                          if (value.isEmpty) return "Campo Sexo vacio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Ejemplo: Hombre",
                          labelText: "Sexo",
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
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          addData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage(registro)));
                          // Navigator.pop(context);
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
