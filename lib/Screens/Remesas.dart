import 'package:encuestabal/Comm/genTextEquipamiento.dart';
import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/ApoyosEnEspecie.dart';
import 'package:encuestabal/Screens/Documentos.dart';
import 'package:flutter/material.dart';
enum OtrosPaises {si, no}
class Remesas extends StatefulWidget {
  String folio;
  Remesas(this.folio);

  @override
  State<Remesas> createState() => _RemesasState();
}

class _RemesasState extends State<Remesas> {

  OtrosPaises _otrosPaises = OtrosPaises.si;
  final _frecuenciaApoyo = TextEditingController();
  var dbHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remesas'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => ApoyosEnEspecie(widget.folio)),
                    (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Folio'),
                SizedBox(height: 5.0),
                getTextFolio(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.folio)),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '¿Alguien en el hogar recibe dinero proveniente de otros paises?'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Si'),
                  leading: Radio<OtrosPaises>(
                    value: OtrosPaises.si,
                    groupValue: _otrosPaises,
                    onChanged: (OtrosPaises value){
                      setState(() {
                        _otrosPaises = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'),
                  leading: Radio<OtrosPaises>(
                    value: OtrosPaises.no,
                    groupValue: _otrosPaises,
                    onChanged: (OtrosPaises value){
                      setState(() {
                        _otrosPaises = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Frecuencia del Apoyo:'),
                SizedBox(height: 5.0),
                getTextField(controller: _frecuenciaApoyo),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new Documentos(widget.folio);
                      }));
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
