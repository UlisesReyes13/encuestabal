import 'package:encuestabal/Screens/LoginForm.dart';
import 'package:encuestabal/Screens/ServiciosBanios.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFormField.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:searchfield/searchfield.dart';
import 'package:encuestabal/Model/NombreAsentamiento.dart';
import 'package:intl/intl.dart';

class DatosGenerales extends StatefulWidget {

  @override
  State<DatosGenerales> createState() => _DatosGeneralesState();
}

class _DatosGeneralesState extends State<DatosGenerales> {
  final _fechaCaptura = TextEditingController();
  final _folio = TextEditingController();
  final _nombreCominidad = TextEditingController();
  final _estado = TextEditingController();
  final _tipoAsentamiento = TextEditingController();
  final _calle = TextEditingController();
  final _entreCalles = TextEditingController();
  final _grupo = TextEditingController();
  final _municipio = TextEditingController();
  final _nombreAsentamiento = TextEditingController();
  final _noExt = TextEditingController();
  final _noInt = TextEditingController();
  final _fecha = TextEditingController();
  final _localidad = TextEditingController();
  final _tipoVialidad = TextEditingController();
  final _cp = TextEditingController();
  final _telefono = TextEditingController();

  final List<NombreAsentamiento> _NombreAsentamiento = [
    NombreAsentamiento(1, 'Heroes de leon'),
    NombreAsentamiento(2, 'hola'),
    NombreAsentamiento(3, 'es de leon'),
  ];

  final List<String> _names = [];

  enviar(){
    String n = _tipoAsentamiento.text;

    print(n);
  }
  @override
  Widget build(BuildContext context) {
    var name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Generales'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginForm()),
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
                SizedBox(height: 10.0,),
                getTextQuestion(question: 'Folio'),
                SizedBox(height: 5.0),
                getTextField(
                  controller: _folio,
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Fecha Captura'),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _fechaCaptura,
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
                      DateTime pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));

                      if(pickeddate != null){
                        setState(() {
                          _fechaCaptura.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Nombre Comunidad/ Programa'),
                SizedBox(height: 5.0),
                getTextField(controller: _nombreCominidad),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Estado'),
                SizedBox(height: 5.0),
                getTextField(controller: _estado),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Asentamiento'),
              //Menu desplegable
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.hidden,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.Nombre, item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 5.0),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Calle'),
                SizedBox(height: 5.0),
                getTextField(controller: _calle),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Entre Calles'),
                SizedBox(height: 5.0),
                getTextField(controller: _entreCalles),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Grupo'),
                SizedBox(height: 5.0),
                getTextField(controller: _grupo),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Municipio'),
                SizedBox(height: 5.0),
                //Menu desplegable
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.hidden,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.Nombre, item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Nombre del Asentamiento'),
                SizedBox(height: 5.0),
                //Menu desplegable
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.hidden,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.Nombre, item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'No.Exterior'),
                SizedBox(height: 5.0),
                getTextField(controller: _noExt),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'No.Interior'),
                SizedBox(height: 5.0),
                getTextField(controller: _noInt),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Fecha'),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _fecha,
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
                      DateTime pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));

                      if(pickeddate != null){
                        setState(() {
                          _fecha.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Localidad'),
                SizedBox(height: 5.0),
                getTextField(controller: _localidad),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Vialidad'),
                SizedBox(height: 5.0),
                //Menu desplegable
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.hidden,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.Nombre, item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Código Postal'),
                SizedBox(height: 5.0),
                //Menu desplegable
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.hidden,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.Nombre, item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Télefono (10 digitos)'),
                SizedBox(height: 5.0),
                getTextField(controller: _telefono),
                SizedBox(height: 10.0),

                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                      onPressed:(){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => ServiciosBanios()),
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
            ) ,
          ),
        ),
      ),
    );
  }
}
