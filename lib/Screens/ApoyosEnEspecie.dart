import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/AportacionesEconomicas.dart';
import 'package:encuestabal/Screens/Remesas.dart';
import 'package:flutter/material.dart';

class ApoyosEnEspecie extends StatefulWidget {
  String folio;

  ApoyosEnEspecie(this.folio);

  @override
  State<ApoyosEnEspecie> createState() => _ApoyosEnEspecieState();
}

class _ApoyosEnEspecieState extends State<ApoyosEnEspecie> {

  final _tipoApoyo = TextEditingController();
  final _quienProporciona = TextEditingController();
  final _frecuenciaApoyo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apoyos En Especie'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => AportacionesEconomicas(widget.folio)),
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
                getTextQuestion(question: 'Folio'),
                SizedBox(height: 5.0),
                getTextFolio(controller: TextEditingController.fromValue(
                    TextEditingValue(text: widget.folio)),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Apoyo'),
                SizedBox(height: 5.0),
                getTextField(controller: _tipoApoyo),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Quien lo Proporciona'),
                SizedBox(height: 5.0),
                getTextField(controller: _quienProporciona),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Frecuencia del Apoyo'),
                SizedBox(height: 5.0),
                getTextField(controller: _frecuenciaApoyo),

                SizedBox(height: 10.0),


                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Remesas(widget.folio)),
                                (Route<dynamic> route) => false);
                      },
                      icon: Icon(Icons.arrow_forward,color: Colors.white,),
                      label: Text('Continuar', style: TextStyle(color: Colors.white)
                        ,)
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
