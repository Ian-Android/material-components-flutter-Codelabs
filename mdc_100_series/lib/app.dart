import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext contxt) {
          return LoginPage();
        },
        fullscreenDialog: true);
  }
}
