import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/ServiciosLuz.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Screens/ServiciosDrenaje.dart';
enum ServAgua {tomaDomiciliaria, tomaComun, pipa, pozo_rio_lago, llavePublica,
acarreoVivienda, otraFuente, ninguna, noTiene, otro}

class ServiciosAgua extends StatefulWidget {

  @override
  State<ServiciosAgua> createState() => _ServiciosAguaState();
}

class _ServiciosAguaState extends State<ServiciosAgua> {

  ServAgua _agua= ServAgua.tomaDomiciliaria;

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
                MaterialPageRoute(builder: (_) => ServiciosLuz()),
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
                getTextQuestion(question: 'AGUA'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Toma Domiciliaria'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.tomaDomiciliaria,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Toma Común o Fuera De Vivivienda'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.tomaComun,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Pipa'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.pipa,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Pozo, Río, Lago'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.pozo_rio_lago,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Llave Publica'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.llavePublica,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Acarrean de Otra Vivienda'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.acarreoVivienda,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otra Fuente'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.otraFuente,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ninguna'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.ninguna,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No Tiene'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.noTiene,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.otro,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
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
                          MaterialPageRoute(builder: (_) => ServiosDrenaje()),
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
