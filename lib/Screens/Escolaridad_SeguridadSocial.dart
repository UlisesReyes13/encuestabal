import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/DerechohabienciasModel.dart';
import 'package:encuestabal/Model/EscolaridadSeguridadSocial.dart';
import 'package:encuestabal/Model/EscolaridadesModel.dart';
import 'package:encuestabal/Model/GradosEscolaresModel.dart';
import 'package:encuestabal/Model/MotivoDerechoHabiencia.dart';
import 'package:encuestabal/Model/OcupacionesModel.dart';
import 'package:encuestabal/Model/PrestacionesLaboralesModel.dart';
import 'package:encuestabal/Model/TipoEmpleoModel.dart';
import 'package:encuestabal/Screens/EstructuraFamiliar.dart';
import 'package:encuestabal/Screens/Salud_PerteneciaIndigena.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:searchfield/searchfield.dart';
import 'package:get/get.dart';

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

  final dataList = <PrestacionesLaboralesModel>[
    PrestacionesLaboralesModel(prestacion: '1 A incapacidad por enfermedad, accidente o maternidad'),
    PrestacionesLaboralesModel(prestacion: '2 B sar o afore'),
    PrestacionesLaboralesModel(prestacion: '3 C crédito para vivienda'),
    PrestacionesLaboralesModel(prestacion: '4 D guardería'),
    PrestacionesLaboralesModel(prestacion: '5 E aguinaldo'),
    PrestacionesLaboralesModel(prestacion: '6 F seguro de vida'),
    PrestacionesLaboralesModel(prestacion: '7 G no tiene derecho a ninguna prestación'),
    PrestacionesLaboralesModel(prestacion: '8 H otro tipo de seguro contratado'),
    PrestacionesLaboralesModel(prestacion: '9 I n/a')
  ].obs;

  final selectedItems = <PrestacionesLaboralesModel>[].obs;

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

  insertDatos() async {

    String asisteEsuela = _asisteEscuela.name.toString();
    if(asisteEsuela == 'na'){
      asisteEsuela = '1 1 N/A';
    }else if(asisteEsuela == 'si'){
      asisteEsuela  = '2 2 Si';
    }else if(asisteEsuela == 'no'){
      asisteEsuela = '3 3 No';
    }

    String Jubilado = _jubilacionPensionado.name.toString();
    if(Jubilado == 'na'){
      Jubilado = '1 1 N/A';
    }else if(Jubilado == 'si'){
      Jubilado  = '2 2 Si';
    }else if(Jubilado == 'no'){
      Jubilado = '3 3 No';
    }

    var AsisteE = asisteEsuela; // 'artlang'
    final asisteE = AsisteE
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

    var Jubilacion = Jubilado; // 'artlang'
    final jubilacion = Jubilacion
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

    var Escolaridad = _escolaridad.text.toString(); // 'artlang'
    final escolaridad = Escolaridad
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

    var Ocupacion = _ocupacion.text.toString(); // 'artlang'
    final ocupacion = Ocupacion
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

    var TipoEmpleo = _tipoEmpleo.text.toString(); // 'artlang'
    final tipoEmpleo = TipoEmpleo
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

    var Derecho = _derechohabiencia.text.toString(); // 'artlang'
    final derecho = Derecho
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

    var MotivoDerecho = _motivoderechohabiencia.text.toString(); // 'artlang'
    final motivoDerecho = MotivoDerecho
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

    selectedItems.clear();
    selectedItems.addAll((dataList.where((p0) => p0.value)));
    print(selectedItems.toString());

    var pkPrestaciones = selectedItems.toString(); // 'artlang'
    final prestacionesPK = pkPrestaciones
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("A", "")
        .replaceAll("B", "")
        .replaceAll("C", "")
        .replaceAll("D", "")
        .replaceAll("E", "")
        .replaceAll("F", "")
        .replaceAll("G", "")
        .replaceAll("H", "")
        .replaceAll("I", "")
        .replaceAll("J", "")
        .replaceAll("K", "")
        .replaceAll("L", "")
        .replaceAll("M", "")
        .replaceAll("N", "")
        .replaceAll("Ñ", "")
        .replaceAll("O", "")
        .replaceAll("P", "")
        .replaceAll("Q", "")
        .replaceAll("R", "")
        .replaceAll("S", "")
        .replaceAll("T", "")
        .replaceAll("V", "")
        .replaceAll("W", "")
        .replaceAll("X", "")
        .replaceAll("Y", "")
        .replaceAll("Z", "")
        .replaceAll("a", "")
        .replaceAll("b", "")
        .replaceAll("c", "")
        .replaceAll("d", "")
        .replaceAll("e", "")
        .replaceAll("f", "")
        .replaceAll("g", "")
        .replaceAll("h", "")
        .replaceAll("i", "")
        .replaceAll("j", "")
        .replaceAll("k", "")
        .replaceAll("l", "")
        .replaceAll("m", "")
        .replaceAll("n", "")
        .replaceAll("ñ", "")
        .replaceAll("o", "")
        .replaceAll("p", "")
        .replaceAll("q", "")
        .replaceAll("r", "")
        .replaceAll("s", "")
        .replaceAll("t", "")
        .replaceAll("u", "")
        .replaceAll("v", "")
        .replaceAll("w", "")
        .replaceAll("x", "")
        .replaceAll("y", "")
        .replaceAll("Á", "")
        .replaceAll("É", "")
        .replaceAll("Í", "")
        .replaceAll("Ó", "")
        .replaceAll("Ú", "")
        .replaceAll("á", "")
        .replaceAll("é", "")
        .replaceAll("í", "")
        .replaceAll("ó", "")
        .replaceAll("ú", "")
        .replaceAll("z", "");

    var intPrestaciones = selectedItems.toString(); // 'artlang'
    final prestacionesInt = intPrestaciones
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("a", "")
        .replaceAll("b", "")
        .replaceAll("c", "")
        .replaceAll("d", "")
        .replaceAll("e", "")
        .replaceAll("f", "")
        .replaceAll("g", "")
        .replaceAll("h", "")
        .replaceAll("i", "")
        .replaceAll("j", "")
        .replaceAll("k", "")
        .replaceAll("l", "")
        .replaceAll("m", "")
        .replaceAll("n", "")
        .replaceAll("ñ", "")
        .replaceAll("o", "")
        .replaceAll("p", "")
        .replaceAll("q", "")
        .replaceAll("r", "")
        .replaceAll("s", "")
        .replaceAll("t", "")
        .replaceAll("u", "")
        .replaceAll("v", "")
        .replaceAll("w", "")
        .replaceAll("x", "")
        .replaceAll("y", "")
        .replaceAll("Á", "")
        .replaceAll("É", "")
        .replaceAll("Í", "")
        .replaceAll("Ó", "")
        .replaceAll("Ú", "")
        .replaceAll("á", "")
        .replaceAll("é", "")
        .replaceAll("í", "")
        .replaceAll("ó", "")
        .replaceAll("ú", "")
        .replaceAll("z", "")
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

    var Prestaciones = selectedItems.toString(); // 'artlang'
    final prestaciones = Prestaciones
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "")
        .replaceAll("A", "")
        .replaceAll("B", "")
        .replaceAll("C", "")
        .replaceAll("D", "")
        .replaceAll("E", "")
        .replaceAll("F", "")
        .replaceAll("G", "")
        .replaceAll("H", "")
        .replaceAll("I", "")
        .replaceAll("J", "")
        .replaceAll("K", "")
        .replaceAll("L", "")
        .replaceAll("M", "")
        .replaceAll("N", "")
        .replaceAll("Ñ", "")
        .replaceAll("O", "")
        .replaceAll("P", "")
        .replaceAll("Q", "")
        .replaceAll("R", "")
        .replaceAll("S", "")
        .replaceAll("T", "")
        .replaceAll("V", "")
        .replaceAll("W", "")
        .replaceAll("X", "")
        .replaceAll("Y", "")
        .replaceAll("Z", "");



    EscolaridadSeguridadSocial DModel = EscolaridadSeguridadSocial
      (folio: int.parse(widget.folio),
        ClaveEscolaridad: _gradoEscolar.text.toString().substring(0,1),
        OrdenEscolaridad: _gradoEscolar.text.toString().substring(0,1),
        Escolaridad: escolaridad.trimLeft(),
        ClaveGradoEscolar: _gradoEscolar.text.toString().substring(0,1),
        GradoEscolar: _gradoEscolar.text.toString().substring(2,3),
        ClaveAsisteEscuela: AsisteE.substring(0,1),
        OrdenAsisteEscuela: AsisteE.substring(0,1),
        AsisteEscuela: asisteE.trimLeft(),
        ClaveOcupacion: _ocupacion.text.toString().substring(0,1),
        OrdenOcupacion: _ocupacion.text.toString().substring(0,1),
        Ocupacion: ocupacion.trimLeft(),
        ClaveTipoEmpleo: _tipoEmpleo.text.toString().substring(0,1) ,
        OrdenTipoEmpleo: _tipoEmpleo.text.toString().substring(0,1) ,
        TipoEmpleo: tipoEmpleo.trimLeft(),

        pk_prestacioneslab: prestacionesPK.trimRight(),
        int_OrdenPrestacionesLab: prestacionesInt.trimRight().trimLeft(),
        txt_desc_prestacioneslab: prestaciones.trimLeft(),

        ClaveJubilacion: Jubilacion.substring(0,1),
        OrdenJubilacion: Jubilacion.substring(0,1),
        Jubilacion: jubilacion.trimLeft(),

        ClaveDerechohabiencia: _derechohabiencia.text.toString().substring(0,1),
        OrdenDerechohabiencia: _derechohabiencia.text.toString().substring(0,1),
        Derechohabiencia: derecho.trimLeft(),
        ClaveMotivoDerechohabiencia: _motivoderechohabiencia.text.toString().substring(0,1),
        OrdenMotivoDerechohabiencia: _motivoderechohabiencia.text.toString().substring(0,1),
        MotivoDerechohabiencia: motivoDerecho.trimLeft()
    );

    await dbHelper.saveEscolaridadSocial(DModel).then((escolaridadSeguridadSocial) {
      alertDialog(context, "Se registro correctamente");

      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new Salud_PertenenciaIndigena(widget.folio);
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
                Obx(() => Column(children: genarateItems())),
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

  /*Widget buildSingleCheckBox(PrestacionesLaboralesModel checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkbox.prestacion),
        value: checkbox.value,
        onChanged: (value) => setState(() => checkbox.value = value),
  );*/

  List <Widget> genarateItems(){
    final result = <Widget>[];
    for(int i = 0; i < dataList.length; i++){
      result.add(CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: dataList[i].value,
          title: Text(dataList[i].prestacion),
          onChanged: (v){
            dataList[i].value = v ?? false;
            dataList.refresh();
          }));
    }
    return  result;
  }
}
