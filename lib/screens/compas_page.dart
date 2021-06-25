import 'package:flutter/material.dart';
import 'package:runningup/constants/Theme.dart';
import 'package:runningup/models/compas-api.dart';
import 'package:runningup/models/compas.dart';
// import 'package:runningup/models/user-api.dart';
// import 'package:runningup/models/user.dart';
import 'package:runningup/prefences/user_preference.dart';
import 'package:runningup/widgets/drawer.dart';

// import 'package:runningup/widgets/navbar.dart';

class CompasPage extends StatefulWidget {
  static String id = 'Compas_Page';

  @override
  _CompasPageState createState() => _CompasPageState();
}

class _CompasPageState extends State<CompasPage> {
  UserPreference userPreference = UserPreference();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setStateVacio());
  }

  void setStateVacio() {
    userPreference.userName = '';
    userPreference.userApe1 = '';
    userPreference.userApe2 = '';
    userPreference.userEmail = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Compas'),
      ),
     
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Compas_Page"),
      
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          _cardTipo2(),
        ],
      ),
      floatingActionButton: _buscarCompa(),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: FutureBuilder(
        future: fetchCompas(userPreference.userIdDrawer),
        builder: (context, AsyncSnapshot<List<Compas>> snapshot) {
          if (snapshot.hasData) {
            
            return ListView.builder(
              shrinkWrap: true,  physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              
              itemBuilder: (BuildContext context, index) {
                Compas compa = snapshot.data[index];
                return ListTile(
                  onTap: () {
               
                    Navigator.pushReplacementNamed(context, '/perfilCompas',
                        arguments: {'emailCompa': compa.emailC});
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://e7.pngegg.com/pngimages/639/61/png-clipart-computer-icons-mobile-phones-contact-free-others-miscellaneous-head.png"),
                  ),
                  title: Text(
                      '${compa.nombre} ${compa.apellidoPaterno} ${compa.apellidoMaterno}'),
                  subtitle: Text('${compa.emailC}'),
                );
              },
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }

  Widget _buscarCompa() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/SearchCompa');
          },
          child: Icon(
            Icons.search_rounded,
          ),
        ),
        SizedBox(width: 5.0),
      ],
    );
  }
}
