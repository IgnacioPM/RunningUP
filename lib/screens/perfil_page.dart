import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  static String id = 'Perfil_Page';

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children:[
              _holaTextField(),
              

            ],
          ),
          
        ),
      ),
      );
    // TODO: implement build
    //throw UnimplementedError();
  }

  Widget _holaTextField(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
             
          ),
        );
      });
  }
}