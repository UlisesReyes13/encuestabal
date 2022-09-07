import 'package:encuestabal/Screens/Escolaridad_SeguridadSocial.dart';
import 'package:encuestabal/Screens/Salud_PerteneciaIndigena.dart';
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
      title: 'ESM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Escolaridad_SeguridadSocial('2'),
    );
  }
}