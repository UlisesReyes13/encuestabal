import 'package:encuestabal/Screens/AportacionesEconomicas.dart';
import 'package:encuestabal/Screens/DatosGenerales.dart';
import 'package:encuestabal/Screens/Equipamiento.dart';
import 'package:flutter/material.dart';

import 'Screens/LoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ESN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AportacionesEconomicas('1'),
    );
  }
}