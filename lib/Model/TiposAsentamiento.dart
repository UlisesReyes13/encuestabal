class TiposAsentamiento {
  String TipoAsentamiento;

  TiposAsentamiento({this.TipoAsentamiento});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'TipoAsentamiento': TipoAsentamiento,

    };
    return map;
  }

  TiposAsentamiento.fromMap(Map<String, dynamic> map) {
    TipoAsentamiento = map['TipoAsentamiento'];
  }

}
