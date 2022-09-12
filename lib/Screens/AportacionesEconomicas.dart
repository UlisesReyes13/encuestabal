import 'package:encuestabal/Comm/genTextConcepto.dart';
import 'package:encuestabal/Comm/genTextEquipamiento.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Comm/genTextAportaciones.dart';
import 'package:encuestabal/Screens/ApoyosEnEspecie.dart';
import 'package:encuestabal/Screens/Equipamiento.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/genTextField.dart';

class AportacionesEconomicas extends StatefulWidget {

  String folio;

  AportacionesEconomicas(this.folio);

  @override
  State<AportacionesEconomicas> createState() => _AportacionesEconomicasState();
}

final _padre = TextEditingController();
final _madre = TextEditingController();
final _hijos = TextEditingController();
final _prospera = TextEditingController();
final _adultosProspera = TextEditingController();
final _becas = TextEditingController();
final _otros = TextEditingController();
final _pension = TextEditingController();
final _totalSemanalS = TextEditingController();
final _totalMensualS = TextEditingController();

final _vivienda = TextEditingController();
final _alimentacion = TextEditingController();
final _luz = TextEditingController();
final _gas = TextEditingController();
final _agua = TextEditingController();
final _telefono = TextEditingController();
final _transporte = TextEditingController();
final _atencionMedica = TextEditingController();
final _otrosGastos = TextEditingController();
final _celular = TextEditingController();
final _educacion = TextEditingController();
final _totalSemanalE = TextEditingController();
final _totalMensualE = TextEditingController();

class _AportacionesEconomicasState extends State<AportacionesEconomicas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aportaciones Economicas'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Equipamineto(widget.folio)),
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
                getTextAportaciones(encabezado: 'Aportación Semanal'),
                Container(
                  child: Row(
                    children: [
                      SizedBox(height: 50.0),
                      getTextEquipamiento(encabezado: 'Concepto'),
                      SizedBox(width: 100.0),
                      getTextEquipamiento(encabezado: 'Importe'),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Padre'),
                    SizedBox(width: 134.0),
                    Expanded(child: getTextField(controller: _padre,),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Madre'),
                    SizedBox(width: 128.0),
                    Expanded(child: getTextField(controller: _madre,),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Hijos'),
                    SizedBox(width: 142.0),
                    Expanded(child: getTextField(controller: _hijos,),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'PROSPERA'),
                    SizedBox(width: 70.0),
                    Expanded(child: getTextField(controller: _prospera),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Adultos Mayores \n PROSPERA'),
                    Expanded(child: getTextField(controller: _adultosProspera,),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Becas'),
                    SizedBox(width: 133.0),
                    Expanded(child: getTextField(controller: _becas),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Otros'),
                    SizedBox(width: 140.0),
                    Expanded(child: getTextField(controller: _otros),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Pensión'),
                    SizedBox(width: 107.0),
                    Expanded(child: getTextField(controller: _pension),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Total Semanal'),
                    SizedBox(width: 36.0),
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                          controller: _totalSemanalS,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                                ),
                              ),
                              fillColor: Colors.grey[120],
                              filled: true
                          ),
                          onTap: () async{
                            setState(() {
                             //Metodo de suma semal
                            });;
                          }
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Total Mensual'),
                    SizedBox(width: 36.0),
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                          controller: _totalMensualS,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                                ),
                              ),
                              fillColor: Colors.grey[120],
                              filled: true
                          ),
                          onTap: () async{
                            setState(() {

                              //Metodo de suma mensual
                            });;
                          }
                      ),
                    ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),

                SizedBox(height: 50.0),
                getTextAportaciones(encabezado: 'Egreso Semanal'),
                Container(
                  child: Row(
                    children: [
                      SizedBox(height: 50.0),
                      getTextEquipamiento(encabezado: 'Concepto'),
                      SizedBox(width: 100.0),
                      getTextEquipamiento(encabezado: 'Importe'),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Vivienda'),
                    SizedBox(width: 107.0),
                    Expanded(child: getTextField(controller: _vivienda),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Alimentación'),
                    SizedBox(width: 53.0),
                    Expanded(child: getTextField(controller: _alimentacion),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Luz'),
                    SizedBox(width: 169.0),
                    Expanded(child: getTextField(controller: _luz),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Gas'),
                    SizedBox(width: 168.0),
                    Expanded(child: getTextField(controller: _gas),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Agua'),
                    SizedBox(width: 150.0),
                    Expanded(child: getTextField(controller: _agua),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Teléfono'),
                    SizedBox(width: 108.0),
                    Expanded(child: getTextField(controller: _telefono),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Transporte'),
                    SizedBox(width: 83.0),
                    Expanded(child: getTextField(controller: _transporte),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Atención Médica'),
                    SizedBox(width: 14.0),
                    Expanded(child: getTextField(controller: _atencionMedica),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Otros Gastos'),
                    SizedBox(width: 58.0),
                    Expanded(child: getTextField(controller: _otrosGastos),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Celular'),
                    SizedBox(width: 126.0),
                    Expanded(child: getTextField(controller: _celular),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Educación'),
                    SizedBox(width: 87.0),
                    Expanded(child: getTextField(controller: _educacion),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Total Semanal'),
                    SizedBox(width: 36.0),
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                          controller: _totalSemanalE,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                                ),
                              ),
                              fillColor: Colors.grey[120],
                              filled: true
                          ),
                          onTap: () async{
                            setState(() {
                              //Metodo de suma semal
                            });;
                          }
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    getTextCocepto(concepto: 'Total Mensual'),
                    SizedBox(width: 36.0),
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                          controller: _totalMensualE,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                                ),
                              ),
                              fillColor: Colors.grey[120],
                              filled: true
                          ),
                          onTap: () async{
                            setState(() {

                              //Metodo de suma mensual
                            });;
                          }
                      ),
                    ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => ApoyosEnEspecie(widget.folio)),
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
