class TipoViviendaModel {
  String TipoVivienda;

  TipoViviendaModel({this.TipoVivienda});

  Map<String, dynamic> toMap(){
    return {
      'TipoVivienda' : TipoVivienda
    };
  }

  TipoViviendaModel.fromMap(Map<String, dynamic>map){
    TipoVivienda = map['TipoVivienda'];
  }
}