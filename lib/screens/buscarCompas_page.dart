import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:runningup/models/compas-api.dart';
import 'package:runningup/models/compas.dart';
import 'package:runningup/models/user.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'dart:async';

import 'home.dart';

String email;

class BuscarCompaPage extends StatefulWidget {
  // final String registro;
  // BuscarCompaPage(this.registro);
  static String id = 'BuscarCompa_page';

  @override
  _BuscarCompaPageState createState() => _BuscarCompaPageState();
}

class _BuscarCompaPageState extends State<BuscarCompaPage> {
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerApellido = new TextEditingController();
  UserPreference userPreference = UserPreference();
  String msg = '';

  // ignore: missing_return
  Future<List> _compas() async {
    await userPreference.initPrefs();

    final response = await http.post(
        Uri.parse('https://runningup.000webhostapp.com/buscarCompa.php'),
        body: {
          "Nombre": controllerNombre.text,
          "Apellido_Paterno": controllerApellido.text,
        });
    List<dynamic> datacompa = jsonDecode(response.body);
    // var correo = controllerNombre.text;
    // var results = await jsonDecode('select name from users where email = ?', [correo]);
    setState(() {
      msg = datacompa.toString();
    });
    if (datacompa.length == 0) {
      setState(() {
        msg = "Compa no encontrado, verifique los datos";
      });
    } else {
      // Compas compas = Compas.fromJson(datacompa.first);
      // controllerNombre.text = compas.nombre + " "  + compas.apellidoPaterno;

      setState(() {
        msg = "Say hola";
      });
    }
    // print(datacompa);
    return datacompa;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: fetchCompas(),
            builder: (context, AsyncSnapshot<List<Compas>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Compas users = snapshot.data[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1512529920731-e8abaea917a5?fit=crop&w=840&q=80"),
                      ),
                      title: Text('${users.nombre} ${users.apellidoPaterno}'),
                    );
                  },
                );
              }

              return CircularProgressIndicator();
            },
            // children: [
            //   SizedBox(
            //     height: 15.0,
            //   ),
            //   _nameTextField(),
            //   SizedBox(
            //     height: 15.0,
            //   ),
            //   _apellido1TextField(),
            //   SizedBox(
            //     height: 20.0,
            //   ),
            //   _bottonBuscar(),
            //   SizedBox(
            //     height: 15.0,
            //   ),
            //   Text(msg, style: TextStyle(fontSize: 25.0, color: Colors.red)),
            //   // Text(widget.registro,
            //   //     style: TextStyle(fontSize: 25.0, color: Colors.green)),
            // ],
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controllerNombre,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Juan',
            labelText: 'Nombre',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _apellido1TextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controllerApellido,
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Pérez',
            labelText: 'Primer apellido',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonBuscar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Buscar Compa',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.blueAccent,
          onPressed: () {
            // Navigator.pushReplacementNamed(context, '/home');
            _compas();
          });
    });
  }
}
