import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/compas-api.dart';
import 'package:runningup/models/compas.dart';
import 'package:runningup/models/user.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';
import 'dart:async';

import 'compas_page.dart';
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
  TextEditingController controllerCorreo = new TextEditingController();
  UserPreference userPreference = UserPreference();
  String msg = '';
  // ignore: missing_return

  Future<List> _compas() async {
    await userPreference.initPrefs();

    final response = await http.post(
        Uri.parse('https://runningup.000webhostapp.com/buscarCompa.php'),
        body: {
          "correo": controllerCorreo.text,
        });
    List<dynamic> datacompa = jsonDecode(response.body);
    // var correo = controllerNombre.text;
    // var results = await jsonDecode('select name from users where email = ?', [correo]);
    setState(() {
      Users user = Users.fromJson(datacompa.first);
      // controllerEmail.text = user.name + " "  + user.ap1 + " " + user.ap2;
      userPreference.userName = user.name;
      userPreference.userApe1 = user.ap1;
      userPreference.userApe2 = user.ap2;
      userPreference.userEmail = user.email;
    });
    if (datacompa.length == 0) {
      setState(() {
        msg = "Compa no encontrado, verifique los datos";
      });
    } else {
      // Compas compas = Compas.fromJson(datacompa.first);
      // controllerNombre.text = compas.nombre + " "  + compas.apellidoPaterno;

    }
    // print(datacompa);
    return datacompa;
  }

  void addData() {
    var url = Uri.parse("https://runningup.000webhostapp.com/agregarCompa.php");

    http.post(url, body: {
      "Nombre": userPreference.userName,
      "Apellido_Paterno": userPreference.userApe1,
      "Apellido_Materno": userPreference.userApe2,
      "email_c": userPreference.userEmail,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Buscar compa'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "BuscarCompa_page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.0,
              ),
              _correoTextField(),
              SizedBox(
                height: 15.0,
              ),
              _bottonBuscar(),
              SizedBox(
                height: 15.0,
              ),
              _mostrarBusqueda(),
              SizedBox(
                height: 15.0,
              ),
              _bottonAgregarCompa(),
              SizedBox(
                height: 15.0,
              ),
              Text(msg, style: TextStyle(fontSize: 25.0, color: Colors.red)),
              // Text(widget.registro,
              //     style: TextStyle(fontSize: 25.0, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _correoTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controllerCorreo,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.mail),
            hintText: 'name@mail.com',
            labelText: 'Correo',
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

  Widget _mostrarBusqueda() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
            userPreference.userName +
                ' ' +
                userPreference.userApe1 +
                ' ' +
                userPreference.userApe2,
            style: TextStyle(color: Colors.black87, fontSize: 21)),
      );
    });
  }

  Widget _bottonAgregarCompa() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Agregar compa',
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
            addData();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CompasPage()));
            // Navigator.pop(context);
          });
    });
  }
}
