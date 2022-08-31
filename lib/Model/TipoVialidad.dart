class TiposVialidad {
  String TipoVialidad;

  TiposVialidad({this.TipoVialidad});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'TipoVialidad': TipoVialidad,
    };
    return map;
  }
  TiposVialidad.fromMap(Map<String, dynamic> map) {
    TipoVialidad = map['TipoVialidad'];
  }
}