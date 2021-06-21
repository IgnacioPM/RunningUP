import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'home.dart';

String email;

class LoginPage extends StatefulWidget {
 final String registro;
  LoginPage(this.registro);
  static String id = 'Login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  String msg = '';
  String correo = '';


  // ignore: missing_return
  Future<List> _login() async {
    final response = await http.post(
        Uri.parse('https://runningup.000webhostapp.com/login.php'),
        body: {
          "email": controllerEmail.text,
          "password": controllerPassword.text,
        });
    var datauser = jsonDecode(response.body);
    // var correo = controllerEmail.text;
    // var results = await jsonDecode('select name from users where email = ?', [correo]);

    if (datauser.length == 0) {
      setState(() {
        msg = "Usuario o contrseña incorrectos";
      });
    } else {

      correo = controllerEmail.text;
      // Navigator.pushReplacementNamed(context, '/home');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(correo)));

    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/img/logo.png',
                  height: 370.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 15.0,
              ),
              _bottonRegister(),
              Text(msg, style: TextStyle(fontSize: 25.0, color: Colors.red)),
              Text(widget.registro, style: TextStyle(fontSize: 25.0, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controllerEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo Electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controllerPassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesion',
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
            _login();
            
          });
    });
  }

  Widget _bottonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Registrarse',
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
             Navigator.pushReplacementNamed(context, '/Registro');
          });
    });
  }
}
