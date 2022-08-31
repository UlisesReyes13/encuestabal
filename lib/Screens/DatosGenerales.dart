import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Model/CodigoPostal.dart';
import 'package:encuestabal/Model/CodigoPostal.dart';
import 'package:encuestabal/Model/DatosGeneralesModel.dart';
import 'package:encuestabal/Model/Estados.dart';
import 'package:encuestabal/Model/Municipios.dart';
import 'package:encuestabal/Model/TipoVialidad.dart';
import 'package:encuestabal/Model/TiposAsentamiento.dart';
import 'package:encuestabal/Screens/LoginForm.dart';
import 'package:encuestabal/Screens/ServiciosBanios.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/genTextField.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:searchfield/searchfield.dart';
import 'package:encuestabal/Model/NombreAsentamiento.dart';
import 'package:intl/intl.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';

class DatosGenerales extends StatefulWidget {

  @override
  State<DatosGenerales> createState() => _DatosGeneralesState();
}

class _DatosGeneralesState extends State<DatosGenerales> {
  final _fechaCaptura = TextEditingController();
  final _folio = TextEditingController();
  final _nombreComunidad = TextEditingController();
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
  var dbHelper;
  var cargar;

  List<NombreAsentamiento> _NombreAsentamiento = List<NombreAsentamiento>();
  List<TiposVialidad> _TiposVialidad = List<TiposVialidad>();
  List<Municipios> _Municipios = List<Municipios>();
  List<TiposAsentamiento> _TiposAsentamiento = List<TiposAsentamiento>();
  List<CodigoPostal> _CodigoPostal = List<CodigoPostal>();

  @override
  void initState() {
    getAllCategoriesNombreAsentamiento();
    getAllCategoriesMunicipios();
    getAllCategoriesTiposAsentamientos();
    getAllCategoriesTipoVialidad();
    super.initState();
    dbHelper = DbHelper();
  }

  getAllCategoriesNombreAsentamiento() async {
    _NombreAsentamiento = List<NombreAsentamiento>();
    var categories = await CategoryService().readCtegoriesNomAsen();
    categories.forEach((category){
      setState(() {
        var categoryModel = NombreAsentamiento();
        categoryModel.NombreAsentamientos = category['NombreAsentamientos'];
        _NombreAsentamiento.add(categoryModel);
      });
    });
  }

  getAllCategoriesMunicipios() async {
    _Municipios = List<Municipios>();
    var categories = await CategoryService().readCtegoriesMunicipios();
    categories.forEach((category){
      setState(() {
        var categoryModel = Municipios();
        categoryModel.Municipio = category['Municipio'];
        _Municipios.add(categoryModel);
      });
    });
  }

  getAllCategoriesTiposAsentamientos() async {
    _TiposAsentamiento = List<TiposAsentamiento>();
    var categories = await CategoryService().readCtegoriesTipoAsentamiento();
    categories.forEach((category){
      setState(() {
        var categoryModel = TiposAsentamiento();
        categoryModel.TipoAsentamiento = category['TipoAsentamiento'];
        _TiposAsentamiento.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoVialidad() async {
    _TiposVialidad = List<TiposVialidad>();
    var categories = await CategoryService().readCtegoriesTipoVialidad();
    categories.forEach((category){
      setState(() {
        var categoryModel = TiposVialidad();
        categoryModel.TipoVialidad = category['TipoVialidad'];
        _TiposVialidad.add(categoryModel);
      });
    });
  }

  insertDatosGenerales() async {

    String folio = _folio.text;
    String fechaCaptura = _fechaCaptura.text;
    String nombreComunidad = _nombreComunidad.text;
    String estado = _estado.text;
    String tipoAsentamiento = _tipoAsentamiento.text;
    String calle = _calle.text;
    String entreCalles = _entreCalles.text;
    String grupo = _grupo.text;
    String municipio = _municipio.text;
    String nombreAsentamiento = _nombreAsentamiento.text;
    String noExt = _noExt.text;
    String noInt = _noInt.text;
    String fecha = _fecha.text;
    String localidad = _localidad.text;
    String tipoVialidad = _tipoVialidad.text;
    String cp = _cp.text;
    String telefono = _telefono.text;




    var Municipio = municipio; // 'artlang'
    final nomMunicipio = Municipio
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


    var claveMunicipio = municipio; // 'artlang'
    final ClaveMuni = claveMunicipio
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

    var claveAsentamiento = nombreAsentamiento; // 'artlang'
    final claveAse = claveAsentamiento
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

    var nombreAsentamientodb = nombreAsentamiento; // 'artlang'
    final nomAsentamiento = nombreAsentamientodb
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



    var ClaveTipoAsentamiento = tipoAsentamiento; // 'artlang'
    final claveTipoAsen = ClaveTipoAsentamiento
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
    var claveTipoAsentamien = claveTipoAsen.substring(0,2);

    var TipoAsentamiento = tipoAsentamiento; // 'artlang'
    final tipoAsenta = TipoAsentamiento
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

    var value = tipoVialidad; // 'artlang'
    final nombreTipoVialidad = value
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



    var claveTipoVialidad = tipoVialidad; // 'artlang'
    final claveTipoVia = claveTipoVialidad
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
    var claveTipoViali = claveTipoVia.substring(0,2);


    print(ClaveMuni.trimRight().toString() + " " + nomMunicipio.trimLeft() + " " +
        claveAse.trimRight().toString() + " " + tipoAsenta.trimLeft() + " " + claveTipoAsentamien.toString()
        + " " + nombreTipoVialidad.trimRight() + " " + claveTipoViali.toString() + " " + nombreTipoVialidad.trimRight());

    DatosGeneralesModel DModel = DatosGeneralesModel
      (int.parse(folio),
        fechaCaptura,
        calle,
        entreCalles,
        grupo,
        noExt,
        noInt,
        fecha,
        localidad,
        telefono,
        int.parse(cp),
        1,
        estado,
        nombreComunidad.trimLeft(),
        int.parse(ClaveMuni.trimRight()),
        nomMunicipio.trimLeft(),
        int.parse(claveAse.trimRight()),
        nomAsentamiento.trimLeft(),
        int.parse(claveTipoAsentamien),
        int.parse(claveTipoAsentamien),
        tipoAsenta.trimRight(),
        int.parse(claveTipoViali),
        int.parse(claveTipoViali),
        nombreTipoVialidad.trimRight());

    await dbHelper.saveDatosGenerales(DModel).then((datosGeneralesData) {
      alertDialog(context, "Se registro correctamente");

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ServiciosBanios()));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }


  @override
  Widget build(BuildContext context) {
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
                getTextQuestion(question: 'Nombre Comunidad/ Programa'),
                SizedBox(height: 5.0),
                getTextField(controller: _nombreComunidad),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Estado'),
                SizedBox(height: 5.0),
                getTextField(controller: _estado),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Municipio'),
                SizedBox(height: 5.0),
                //Menu desplegable Municipio
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
                    suggestions: _Municipios.map((municipios) =>
                        SearchFieldListItem(municipios.Municipio, item: municipios)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _municipio,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Nombre del Asentamiento'),
                SizedBox(height: 5.0),
                //Menu desplegable Nombre Asentamiento
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
                    suggestions: _NombreAsentamiento.map((nombreAsentamiento) =>
                        SearchFieldListItem(nombreAsentamiento.NombreAsentamientos ,item: nombreAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _nombreAsentamiento,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Asentamiento'),
              //Menu desplegable Tipo Asententamiento
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
                    suggestions: _TiposAsentamiento.map((tiposAsentamiento) =>
                        SearchFieldListItem(tiposAsentamiento.TipoAsentamiento, item: tiposAsentamiento)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoAsentamiento,
                    maxSuggestionsInViewPort: 5,
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
                    suggestions: _CodigoPostal.map((codigoPostal) =>
                        SearchFieldListItem(codigoPostal.claveCodigoPostal.toString(), item: codigoPostal)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _cp,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Localidad'),
                SizedBox(height: 5.0),
                getTextField(controller: _localidad),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Calle'),
                SizedBox(height: 5.0),
                getTextField(controller: _calle),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Entre Calles'),
                SizedBox(height: 5.0),
                getTextField(controller: _entreCalles),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'No.Exterior'),
                SizedBox(height: 5.0),
                getTextField(controller: _noExt),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'No.Interior'),
                SizedBox(height: 5.0),
                getTextField(controller: _noInt),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Grupo'),
                SizedBox(height: 5.0),
                getTextField(controller: _grupo),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo de Vialidad'),
                SizedBox(height: 5.0),
                //Menu desplegable
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
                    suggestions: _TiposVialidad.map((tipovialidad) =>
                        SearchFieldListItem(tipovialidad.TipoVialidad, item: tipovialidad)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoVialidad,
                    maxSuggestionsInViewPort: 5,
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
                      onPressed:insertDatosGenerales,
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
