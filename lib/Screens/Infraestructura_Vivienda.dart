import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/TipoMuroModel.dart';
import 'package:encuestabal/Model/TipoPisoModel.dart';
import 'package:encuestabal/Model/TipoTechoModel.dart';
import 'package:encuestabal/Model/TipoTenenciaModel.dart';
import 'package:encuestabal/Model/TipoViviendaModel.dart';
import 'package:encuestabal/Screens/Salud_PerteneciaIndigena.dart';
import 'package:encuestabal/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class Infraestructura_Vivienda extends StatefulWidget {

  String folio;
  Infraestructura_Vivienda(this.folio);

  @override
  State<Infraestructura_Vivienda> createState() => _Infraestructura_ViviendaState();
}


class _Infraestructura_ViviendaState extends State<Infraestructura_Vivienda> {

  List<TipoViviendaModel> _TipoVivienda = List<TipoViviendaModel>();
  List<TipoPisoModel> _TipoPiso = List<TipoPisoModel>();
  List<TipoTenenciaModel> _TipoTenencia = List<TipoTenenciaModel>();
  List<TipoTechoModel> _TipoTecho = List<TipoTechoModel>();
  List<TipoMuroModel> _TipoMuro = List<TipoMuroModel>();

  final _tipoCasa = TextEditingController();
  final _tipoPiso = TextEditingController();
  final _tipoTenencia = TextEditingController();
  final _tipoTecho = TextEditingController();
  final _tipoMuro = TextEditingController();

  var dbHelper = DbHelper();

  @override
  void initState(){
    getAllCategoriesTipoMuro();
    getAllCategoriesTipoPiso();
    getAllCategoriesTipoTecho();
    getAllCategoriesTipoTenencia();
    getAllCtegoriesTipoVivienda();


    super.initState();
  }

  getAllCtegoriesTipoVivienda() async{
    _TipoVivienda = List<TipoViviendaModel>();
    var categories = await CategoryService().readCategoriesTipoVivienda();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoViviendaModel();
        categoryModel.TipoVivienda = category['TipoVivienda'];
        _TipoVivienda.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoPiso() async{
    _TipoPiso = List<TipoPisoModel>();
    var categories = await CategoryService().readCategoriesTipoPiso();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoPisoModel();
        categoryModel.TipoPiso = category['TipoPiso'];
        _TipoPiso.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoTenencia() async{
    _TipoTenencia = List<TipoTenenciaModel>();
    var categories = await CategoryService().readCategoriesTipoTenencia();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoTenenciaModel();
        categoryModel.Tenencia = category['Tenencia'];
        _TipoTenencia.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoTecho() async{
    _TipoTecho = List<TipoTechoModel>();
    var categories = await CategoryService().readCategoriesTipoTecho();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoTechoModel();
        categoryModel.Techo = category['Techo'];
        _TipoTecho.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoMuro() async{
    _TipoMuro = List<TipoMuroModel>();
    var categories = await CategoryService().readCategoriesTipoMuro();
    categories.forEach((category){
      setState(() {
        var categoryModel = TipoMuroModel();
        categoryModel.TipoMuro = category['TipoMuro'];
        _TipoMuro.add(categoryModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado de la Casa y Construcción'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Salud_PertenenciaIndigena(widget.folio)),
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
                getTextQuestion(question: 'Tipo de Casa'),
                SizedBox(height: 5.0),
                //Menu desplegable Tipo de casa
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
                    suggestions: _TipoVivienda.map((tipoCasa) =>
                        SearchFieldListItem(tipoCasa.TipoVivienda, item: tipoCasa)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoCasa,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),


                SizedBox(height: 10.0),
                getTextQuestion(question: 'Mayor parte del Piso'),
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
                    suggestions: _TipoPiso.map((tipoPiso) =>
                        SearchFieldListItem(tipoPiso.TipoPiso, item: tipoPiso)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoPiso,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tenencia'),
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
                    suggestions: _TipoTenencia.map((tipoTenencia) =>
                        SearchFieldListItem(tipoTenencia.Tenencia, item: tipoTenencia)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoTenencia,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Mayor Parte  del Techo'),
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
                    suggestions: _TipoTecho.map((tipoTecho) =>
                        SearchFieldListItem(tipoTecho.Techo, item: tipoTecho)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoTecho,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Mayor parte de Muros'),
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
                    suggestions: _TipoMuro.map((tipoMuro) =>
                        SearchFieldListItem(tipoMuro.TipoMuro, item: tipoMuro)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoMuro,
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
