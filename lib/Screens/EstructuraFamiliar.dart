import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/EstadosCiviles.dart';
import 'package:encuestabal/Screens/Escolaridad_SeguridadSocial.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Screens/ServiciosCombustible.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:encuestabal/Model/Parentesco.dart';

enum Sexo {hombre,mujer}

class EstructuraFamiliar extends StatefulWidget {

  String folio;
  EstructuraFamiliar(this.folio);
  
  @override
  State<EstructuraFamiliar> createState() => _EstructuraFamiliarState();
}

class _EstructuraFamiliarState extends State<EstructuraFamiliar> {
  final _nombre = TextEditingController();
  final _primerApellido = TextEditingController();
  final _segundoApellido = TextEditingController();
  Sexo _sexo = Sexo.hombre;
  final _fechaNacimiento = TextEditingController();
  final _entidadNacimiento = TextEditingController();
  final _estadoCivil = TextEditingController();
  final _parentesco = TextEditingController();

  var dbHelper;
  List<EstadosCiviles> _EstadosCiviles = List<EstadosCiviles>();
  List<Parentescos> _Parentesco = List<Parentescos>();

  @override
  void initState(){
    getAllCategoriesEstadosCiviles();
    getAllCategoriesParentesco();
    dbHelper = DbHelper();
  }

  getAllCategoriesEstadosCiviles() async{
    _EstadosCiviles = List<EstadosCiviles>();
    var categories = await CategoryService().readCategoriesEstadosCiviles();
    categories.forEach((category){
      setState(() {
        var categoryModel = EstadosCiviles();
        categoryModel.EstadoCivil = category['EstadoCivil'];
        _EstadosCiviles.add(categoryModel);
      });
    });
  }

  getAllCategoriesParentesco() async{
    _Parentesco = List<Parentescos>();
    var categories = await CategoryService().readCategoriesParentesco();
    categories.forEach((category){
      setState(() {
        var categoryModel = Parentescos();
        categoryModel.Parentesco = category['Parentesco'];
        _Parentesco.add(categoryModel);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura Familiar'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => ServiciosCombustible(widget.folio)),
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
                    TextEditingValue(text: widget.folio))
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Nombre(s)'),
                SizedBox(height: 5.0),
                getTextField(controller: _nombre),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Primer Apellido'),
                SizedBox(height: 5.0),
                getTextField(controller: _primerApellido),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Segundo Apellido'),
                SizedBox(height: 5.0),
                getTextField(controller: _segundoApellido),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Sexo'),
                ListTile(
                  title: Text('Hombre'),
                  leading: Radio<Sexo>(
                    value: Sexo.hombre,
                    groupValue: _sexo,
                    onChanged: (Sexo value){
                      setState(() {
                        _sexo = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Hombre'),
                  leading: Radio<Sexo>(
                    value: Sexo.mujer,
                    groupValue: _sexo,
                    onChanged: (Sexo value){
                      setState(() {
                        _sexo = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Fecha De Nacimiento'),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _fechaNacimiento,
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
                          firstDate: DateTime(1800),
                          lastDate: DateTime(2100));

                      if(pickeddate != null){
                        setState(() {
                          _fechaNacimiento.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Entidad De Nacimiento'),
                SizedBox(height: 5.0),
                getTextField(controller: _entidadNacimiento),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Estado Civil'),
                //Menu desplegable Estado Civil
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
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
                    suggestions: _EstadosCiviles.map((estadosCiviles) =>
                        SearchFieldListItem(estadosCiviles.EstadoCivil, item: estadosCiviles)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _estadoCivil,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Parentesco'),
                //Menu desplegable parentesco
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
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
                    suggestions: _Parentesco.map((parentesco) =>
                        SearchFieldListItem(parentesco.Parentesco, item: parentesco)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _parentesco,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child : FlatButton.icon(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => EstructuraFamiliar(widget.folio)),
                                      (Route<dynamic> route) => false);
                            },
                            icon: Icon(Icons.add,color: Colors.white,),
                            label: Text('Ingresar otro Integrante', style: TextStyle(color: Colors.white)
                              ,)
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Container(
                        child: FlatButton.icon(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => Escolaridad_SeguridadSocial()),
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
