import 'dart:math';

import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/AdiccionesModel.dart';
import 'package:encuestabal/Model/CondicionesSaludModel.dart';
import 'package:encuestabal/Model/DiscapacidadesModel.dart';
import 'package:encuestabal/Model/PuebloIndigenaModel.dart';
import 'package:encuestabal/Model/SaludPerteneciaIndigenaModel.dart';
import 'package:encuestabal/Screens/Escolaridad_SeguridadSocial.dart';
import 'package:encuestabal/Screens/Infraestructura_Vivienda.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class Salud_PertenenciaIndigena extends StatefulWidget {

  String folio;
  Salud_PertenenciaIndigena(this.folio);

  @override
  State<Salud_PertenenciaIndigena> createState() => _Salud_PertenenciaIndigenaState();
}

class _Salud_PertenenciaIndigenaState extends State<Salud_PertenenciaIndigena> {

  final _discapacidad = TextEditingController();
  final _condicionesSalud = TextEditingController();
  final _adiccion = TextEditingController();
  final _peso = TextEditingController();
  final _talla = TextEditingController();
  final _puebloIndigena = TextEditingController();
  static double imC;

  var dbHelper;

  List<CapacidadesDiferentes> _Discapacidades = List<CapacidadesDiferentes>();
  List<CondicioneSaludModel> _Condiciones = List<CondicioneSaludModel>();
  List<AdiccionesModel> _Adicciones = List<AdiccionesModel>();
  List<PuebloIndigenaModel> _PueblosIndigenas = List<PuebloIndigenaModel>();

  @override
  void initState(){
  getAllCategoriesAdicciones();
  getAllCategoriesCondicionesSalud();
  getAllCategoriesDiscapacidades();
  getAllCategoriesPuebloIndigena();

  dbHelper = DbHelper();
  }

  IMC() {
    String peso = _peso.text;
    String talla = _talla.text;
    if(peso == "" && talla == ""){
      peso = "0";
      talla = "0";
    }
    double tallaM = double.parse(talla)/100;
    double indice = double.parse(peso) / pow(tallaM, 2);
    String i = indice.toString();
    final _imc = TextEditingController.fromValue(TextEditingValue(text: i));
    imC = double.parse(i);
    return _imc;
  }

  getAllCategoriesDiscapacidades() async {
    _Discapacidades = List<CapacidadesDiferentes>();
    var categories = await CategoryService().readCategoriesDiscapacidades();
    categories.forEach((category){
      setState(() {
        var categoryModel = CapacidadesDiferentes();
        categoryModel.CapacidadDiferente = category['CapacidadDiferente'];
        _Discapacidades.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud() async{
    _Condiciones = List<CondicioneSaludModel>();
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category){
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        _Condiciones.add(categoryModel);
      });
    });
  }

  getAllCategoriesAdicciones() async{
    _Adicciones = List<AdiccionesModel>();
    var categories = await CategoryService().readCategoriesAdicciones();
    categories.forEach((category){
      setState(() {
        var categoryModel = AdiccionesModel();
        categoryModel.Adiccion = category['Adiccion'];
        _Adicciones.add(categoryModel);
      });
    });
  }

  getAllCategoriesPuebloIndigena() async {
    _PueblosIndigenas = List<PuebloIndigenaModel>();
    var categories = await CategoryService().readCategoriesPuebloIndigena();
    categories.forEach((category){
      setState(() {
        var categoryModel = PuebloIndigenaModel();
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        _PueblosIndigenas.add(categoryModel);
      });
    });
  }

  insertarDatos() async {

    String discapacidad = _discapacidad.text;
    String condicionesSalud = _condicionesSalud.text;
    String adiccion = _adiccion.text;
    String peso = _peso.text;
    String talla = _talla.text;
    String puebloIndigena = _puebloIndigena.text;

    var Discapacidad1 = discapacidad; // 'artlang'
    final discapacida = Discapacidad1
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "");

    var CondicionesSalud1 = condicionesSalud; // 'artlang'
    final condicionesSalu = CondicionesSalud1
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "");

    var Adiccion1 = adiccion; // 'artlang'
    final adiccio = Adiccion1
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "");

    var PuebloIndigena1 = puebloIndigena; // 'artlang'
    final puebloIndigena1 = PuebloIndigena1
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "");

    SaludPerteneciaIndigenaModel DModel = SaludPerteneciaIndigenaModel(
      folio: int.parse(widget.folio),
      ClaveCapacidadDiferente: discapacidad.substring(0,1),
      OrdenCapacidadDiferente: discapacidad.substring(2,3),
      CapacidadDiferente: discapacida.trimLeft(),
      ClaveCondicionesSalud: condicionesSalud.substring(0,1),
      OrdenCondicionesSalud: condicionesSalud.substring(2,3),
      CondicionesSalud: condicionesSalu.trimLeft(),
      ClaveAdiccion: adiccion.substring(0,1),
      OrdenAdiccion: adiccion.substring(2,3),
      Adiccion: adiccio.trimLeft(),
      peso: int.parse(peso),
      talla: int.parse(talla),
      imc: imC,
      ClaveEtniaIndigena: puebloIndigena.substring(0,1),
      OrdenEtniaIndigena: puebloIndigena.substring(2,3),
      EtniaIndigena: puebloIndigena1.trimLeft(),
    );

    await dbHelper.saveSaludIndigena(DModel).then((saludPerteneciaIndigenaModel) {
      alertDialog(context, "Se registro correctamente");

      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new Infraestructura_Vivienda(widget.folio);
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
        title: Text('Salud / Pertenencia Indigena'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Escolaridad_SeguridadSocial(widget.folio)),
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
                getTextFolio(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: widget.folio))),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Discapacidades'),
                SizedBox(height: 5.0),
                //Menu desplegable Adicciones
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
                    suggestions: _Discapacidades.map((discapacidad) =>
                        SearchFieldListItem(discapacidad.CapacidadDiferente, item: discapacidad)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _discapacidad,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Condiciones de Salud'),
                SizedBox(height: 5.0),
                //Menu desplegable condiciones de salud
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
                    suggestions: _Condiciones.map((condicion) =>
                        SearchFieldListItem(condicion.CondicionesSalud, item: condicion)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _condicionesSalud,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Adicciones'),
                SizedBox(height: 5.0),
                //Menu desplegable Adicciones
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
                    suggestions: _Adicciones.map((adiccion) =>
                        SearchFieldListItem(adiccion.Adiccion, item: adiccion)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _adiccion,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Peso (Kg)'),
                SizedBox(height: 5.0),
                getTextField(controller: _peso),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Talla (cm)'),
                getTextField(controller: _talla),
                SizedBox(height: 5.0),
                getTextQuestion(question: 'IMC'),
                TextField(controller: IMC(),
                  onTap: () async{
                    setState(() {
                      IMC();
                    });;
                  }
                  ,),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Pueblo Indigena'),
                //Menu desplegable pueblo indigena
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
                    suggestions: _PueblosIndigenas.map((pueblo) =>
                        SearchFieldListItem(pueblo.EtniaIndigena, item: pueblo)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _puebloIndigena,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                      onPressed: insertarDatos,
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
