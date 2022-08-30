import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/EstructuraFamiliar.dart';
import 'package:encuestabal/Screens/ServiciosDrenaje.dart';
import 'package:flutter/material.dart';

enum ServCombustible {gasTanque, gasNatural, parrillaElectrica,
  leniaChimenea, leniaSinChimenea, otroCombustible, ninguno}

class ServiciosCombustible extends StatefulWidget {

  @override
  State<ServiciosCombustible> createState() => _ServiciosCombustibleState();
}

class _ServiciosCombustibleState extends State<ServiciosCombustible> {
  ServCombustible _combustible = ServCombustible.gasTanque;

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
                MaterialPageRoute(builder: (_) => ServiosDrenaje()),
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
                getTextQuestion(question: 'Combustible'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Gas en Tanque'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.gasTanque,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Gas Natural'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.gasNatural,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Parrilla Eléctrica'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.parrillaElectrica,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Leña o Carbón con Chimenea'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.leniaChimenea,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('leña o Carbón sin Chimenea'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.leniaSinChimenea,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro Combustible'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.otroCombustible,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ninguno'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.ninguno,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
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
                          MaterialPageRoute(builder: (_) => EstructuraFamiliar()),
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
