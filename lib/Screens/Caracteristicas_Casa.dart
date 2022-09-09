import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/CaracteristicasCasa.dart';
import 'package:encuestabal/Screens/Equipamiento.dart';
import 'package:encuestabal/Screens/Infraestructura_Vivienda.dart';
import 'package:flutter/material.dart';

enum CocinaSeparada {si, no}
enum CuartoBanio {si, no}

class Caracteristicas_Casa extends StatefulWidget {

  String folio;
  Caracteristicas_Casa(this.folio);

  @override
  State<Caracteristicas_Casa> createState() => _Caracteristicas_CasaState();
}

class _Caracteristicas_CasaState extends State<Caracteristicas_Casa> {

  final _numCuartos = TextEditingController();
  final _numCuartosDormir = TextEditingController();
  CocinaSeparada _cocinaSeparada = CocinaSeparada.si;
  CuartoBanio _cuartoBanio = CuartoBanio.si;

  var dbHelper;
  @override
  void initState() {

    super.initState();
    dbHelper = DbHelper();
  }

  insertDatos() async {

    CaracteristicasCasa DModel = CaracteristicasCasa
      (folio: int.parse(widget.folio),
        numCuartos: _numCuartos.text.toString(),
        cuartosDormir: _numCuartosDormir.text.toString(),
        cocinaSeparada: _cocinaSeparada.name,
        cuartoBanioExclusivo:_cuartoBanio.name
    );

    await dbHelper.saveCasa(DModel).then((caracteristicasCasa) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new Equipamineto(widget.folio);
      }
      ));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caracteristicas de la Casa'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Infraestructura_Vivienda(widget.folio)),
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
                  getTextQuestion(question: 'Número de Cuartos'),
                  SizedBox(height: 5.0),
                  getTextField(controller: _numCuartos),
                  SizedBox(height: 10.0),
                  getTextQuestion(question: 'Cuartos para Dormir'),
                  SizedBox(height: 5.0),
                  getTextField(controller: _numCuartosDormir),
                  SizedBox(height: 10.0),
                  getTextQuestion(question: 'Cocina Separada'),
                  ListTile(
                    title: Text('Si'),
                    leading: Radio<CocinaSeparada>(
                      value: CocinaSeparada.si,
                      groupValue: _cocinaSeparada,
                      onChanged: (CocinaSeparada value){
                        setState(() {
                          _cocinaSeparada = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('No'),
                    leading: Radio<CocinaSeparada>(
                      value: CocinaSeparada.no,
                      groupValue: _cocinaSeparada,
                      onChanged: (CocinaSeparada value){
                        setState(() {
                          _cocinaSeparada = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  getTextQuestion(question: 'Cuarto de Baño Exclusivo'),
                  ListTile(
                    title: Text('Si'),
                    leading: Radio<CuartoBanio>(
                      value: CuartoBanio.si,
                      groupValue: _cuartoBanio,
                      onChanged: (CuartoBanio value){
                        setState(() {
                          _cuartoBanio = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('No'),
                    leading: Radio<CuartoBanio>(
                      value: CuartoBanio.no,
                      groupValue: _cuartoBanio,
                      onChanged: (CuartoBanio value){
                        setState(() {
                          _cuartoBanio = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    width: double.infinity,
                    child: FlatButton.icon(
                        onPressed: insertDatos,
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
