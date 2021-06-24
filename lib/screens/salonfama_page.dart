import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/widgets/drawer.dart';

class SalonFamaPage extends StatefulWidget {
  static String id = 'SalonFama_Page';

  @override
  _SalonFamaPageState createState() => _SalonFamaPageState();
}

class _SalonFamaPageState extends State<SalonFamaPage> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Salon de la Fama'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"SalonFama_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            SizedBox(
                height: 15.0,
              ),
            Text(
              'Hola este es el Saolon de la Fama papu ^_~'
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