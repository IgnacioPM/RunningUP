import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';




class CronoPage extends StatefulWidget {
  static String id = 'Crono_Page';

  @override
  _CronoPageState createState() => _CronoPageState();
}

class _CronoPageState extends State<CronoPage> {
final StopWatchTimer _stopWatchTimer = StopWatchTimer();
final _isHours = true;

@override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var fontweight;
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registro de Actividad'),
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage:"RegisAct_Page"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'el cronometro ira aqui'
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(

              ),
            ],
          ),
          
          
        ) ,
          
        );
      
  
  }


}