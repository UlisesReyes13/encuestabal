import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/ServiciosAgua.dart';
import 'package:encuestabal/Screens/ServiciosCombustible.dart';
import 'package:flutter/material.dart';

enum ServDrenaje {redPublica, fosaSeptica, tuberiaGrieta, otro, sinServicio,
noTiene, tuberiaRio, rasSuelo, letrina, drenaje}

class ServiosDrenaje extends StatefulWidget {

  @override
  State<ServiosDrenaje> createState() => _ServiosDrenajeState();
}

class _ServiosDrenajeState extends State<ServiosDrenaje> {
  ServDrenaje _drenaje = ServDrenaje.redPublica;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => ServiciosAgua()),
                    (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Drenaje'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Red Pública'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.redPublica,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Fosa Séptica'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.fosaSeptica,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Tubería que va a dar a una Grieta o Barranca'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.tuberiaGrieta,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.otro,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Sin Servicio'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.sinServicio,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No Tiene'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.noTiene,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Tubería que da a un Río, Lago o Mar'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.tuberiaRio,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ras de Suelo'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.rasSuelo,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Letrina'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.letrina,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Drenaje'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.drenaje,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => ServiciosCombustible()),
                              (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.white),
                    label: Text('Continuar', style: TextStyle(color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
