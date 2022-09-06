import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/DerechohabienciasModel.dart';
import 'package:encuestabal/Model/EscolaridadesModel.dart';
import 'package:encuestabal/Model/GradosEscolaresModel.dart';
import 'package:encuestabal/Model/MotivoDerechoHabiencia.dart';
import 'package:encuestabal/Model/OcupacionesModel.dart';
import 'package:encuestabal/Model/TipoEmpleoModel.dart';
import 'package:encuestabal/Screens/EstructuraFamiliar.dart';
import 'package:encuestabal/Screens/Salud_PerteneciaIndigena.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:searchfield/searchfield.dart';

enum AsisteEscuela{si, no, na}
enum JubilacionPensionado {na, si, no}

class Escolaridad_SeguridadSocial extends StatefulWidget {

String folio;

Escolaridad_SeguridadSocial(this.folio);

  @override
  State<Escolaridad_SeguridadSocial> createState() => _Escolaridad_SeguridadSocialState();
}

class _Escolaridad_SeguridadSocialState extends State<Escolaridad_SeguridadSocial> {
  final _escolaridad = TextEditingController();
  final _gradoEscolar = TextEditingController();
  final _ocupacion = TextEditingController();
  final _tipoEmpleo = TextEditingController();
  final _derechohabiencia = TextEditingController();
  final _motivoderechohabiencia = TextEditingController();
  AsisteEscuela _asisteEscuela = AsisteEscuela.si;
  JubilacionPensionado _jubilacionPensionado = JubilacionPensionado.na;
  var dbHelper;

  List<EscolaridadesModel> _Escolaridad = List<EscolaridadesModel>();
  List<GradosEscolaresModel> _GradoEscolar = List<GradosEscolaresModel>();
  List<OcupacionesModel> _Ocupacion = List<OcupacionesModel>();
  List<TipoEmpleoModel> _TipoEmpleo = List<TipoEmpleoModel>();
  List<DerechoHabienciasModel> _Derechohabiencia = List<DerechoHabienciasModel>();
  List<MotivoDerechoHabienciasModel> _MotivioDerechohabiencia = List<MotivoDerechoHabienciasModel>();

  @override
  void initState(){
  getAllCategoriesDerechohabiencia();
  getAllCategoriesEscolaridades();
  getAllCategoriesGradoEscolar();
  getAllCategoriesMotivoDerechohabiencias();
  getAllCategortegoriesTipoEmpleo();
  getAllCategoriesOcupacion();

  super.initState();
  dbHelper = DbHelper();
  }

  getAllCategoriesEscolaridades() async{
    _Escolaridad = List<EscolaridadesModel>();
    var categories = await CategoryService().readCategoriesEcolaridades();
    categories.forEach((category){
      setState(() {
        var categoryModel = EscolaridadesModel();
        categoryModel.escolaridad = category['Escolaridad'];
        _Escolaridad.add(categoryModel);
      });
    });
  }

  getAllCategoriesGradoEscolar() async {
    _GradoEscolar = List<GradosEscolaresModel>();
    var categories = await CategoryService().readCategoriesGradosEscolares();
    categories.forEach((category){
      setState(() {
        var categoryModel = GradosEscolaresModel();
        categoryModel.grado = category['GradoEscolar'];
        _GradoEscolar.add(categoryModel);
      });
    });
  }

  getAllCategoriesOcupacion() async {
    _Ocupacion = List<OcupacionesModel>();
    var categories = await CategoryService().readCategoriesOcupaciones();
    categories.forEach((category){
      setState(() {
        var categoryModel = OcupacionesModel();
        categoryModel.ocupacion = category['Ocupacion'];
        _Ocupacion.add(categoryModel);
      });
    });
  }

  getAllCategortegoriesTipoEmpleo() async {
    _TipoEmpleo = List<TipoEmpleoModel>();
    var categories = await CategoryService().readCategoriesTipoEmpleos();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoEmpleoModel();
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        _TipoEmpleo.add(categoryModel);
      });
    });
  }

  getAllCategoriesDerechohabiencia() async{
    _Derechohabiencia = List<DerechoHabienciasModel>();
    var categories = await CategoryService().readCategoriesDerechohabiencias();
    categories.forEach((category){
      setState(() {
        var categoryModel = DerechoHabienciasModel();
        categoryModel.derechoHabiencia = category['Derechohabiencia'];
        _Derechohabiencia.add(categoryModel);
      });
    });
  }

  getAllCategoriesMotivoDerechohabiencias() async {
    _MotivioDerechohabiencia = List<MotivoDerechoHabienciasModel>();
    var categories = await CategoryService().readCategoriesMotivoDerechohabiencias();
    categories.forEach((category){
      setState(() {
        var categoryModel = MotivoDerechoHabienciasModel();
        categoryModel.motivoDerechoHabiencia = category['MotivoDerechohabiencia'];
        _MotivioDerechohabiencia.add(categoryModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolaridad / Seguridad Social'),
          leading: IconButton(
            icon : Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => EstructuraFamiliar(widget.folio)),
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
                getTextQuestion(question: 'Escolaridad'),
                SizedBox(height: 5.0),
                //Menu desplegable Escolaridades
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                          ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _Escolaridad.map((escolaridad) =>
                        SearchFieldListItem(escolaridad.escolaridad, item: escolaridad)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _escolaridad,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Grado escolar'),
                //Menu desplegable grado escolar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _GradoEscolar.map((gradoEscolar) =>
                        SearchFieldListItem(gradoEscolar.grado, item: gradoEscolar)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _gradoEscolar,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Asisite a la escuela'),
                      ListTile(
                        title: Text('Si'),
                        leading: Radio<AsisteEscuela>(
                          value: AsisteEscuela.si,
                          groupValue: _asisteEscuela,
                          onChanged: (AsisteEscuela value){
                            setState(() {
                              _asisteEscuela = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('No'),
                        leading: Radio<AsisteEscuela>(
                          value: AsisteEscuela.no,
                          groupValue: _asisteEscuela,
                          onChanged: (AsisteEscuela value){
                            setState(() {
                              _asisteEscuela = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('N/A'),
                        leading: Radio<AsisteEscuela>(
                          value: AsisteEscuela.na,
                          groupValue: _asisteEscuela,
                          onChanged: (AsisteEscuela value){
                            setState(() {
                              _asisteEscuela = value;
                            });
                            },
                        ),
                      ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Ocupación'),
                SizedBox(height: 5.0),
                //Menu desplegable ocupaciones
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _Ocupacion.map((ocupacion) =>
                        SearchFieldListItem(ocupacion.ocupacion, item: ocupacion)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _ocupacion,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Empleo'),
                SizedBox(height: 5.0),
                //Menu desplegable tipo de empleo
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                        SearchFieldListItem(tipoEmpleo.TipoEmpleo, item: tipoEmpleo)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoEmpleo,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Prestaciones Laborales'),

                SizedBox(height: 5.0),
                getTextQuestion(question: 'Jubilación o Pensionado'),
                ListTile(
                  title: Text('N/A'),
                  leading: Radio<JubilacionPensionado>(
                    value: JubilacionPensionado.na,
                    groupValue: _jubilacionPensionado,
                    onChanged: (JubilacionPensionado value){
                      setState(() {
                        _jubilacionPensionado = value;
                      });
                      },
                  ),
                ),
                ListTile(
                  title: Text('Si'),
                  leading: Radio<JubilacionPensionado>(
                    value: JubilacionPensionado.si,
                    groupValue: _jubilacionPensionado,
                    onChanged: (JubilacionPensionado value){
                      setState(() {
                        _jubilacionPensionado = value;
                      });
                      },
                  ),
                ),
                ListTile(
                  title: Text('NO'),
                  leading: Radio<JubilacionPensionado>(
                    value: JubilacionPensionado.no,
                    groupValue: _jubilacionPensionado,
                    onChanged: (JubilacionPensionado value){
                      setState(() {
                        _jubilacionPensionado = value;
                      });
                      },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Derechohabiencia'),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _Derechohabiencia.map((derechohabiencia) =>
                        SearchFieldListItem(derechohabiencia.derechoHabiencia, item: derechohabiencia)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _derechohabiencia,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Motivo de Derechohabiencia'),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _MotivioDerechohabiencia.map((motivoderechohabiencia) =>
                        SearchFieldListItem(motivoderechohabiencia.motivoDerechoHabiencia, item: motivoderechohabiencia)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _motivoderechohabiencia,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
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
                            MaterialPageRoute(builder: (_) => Salud_PertenenciaIndigena(widget.folio)),
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
