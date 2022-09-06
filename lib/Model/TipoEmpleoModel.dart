class TipoEmpleoModel {
  String TipoEmpleo;

  TipoEmpleoModel({this.TipoEmpleo});

  Map<String, dynamic> toMap() {
    return {
      'TipoEmpleo': TipoEmpleo
    };
  }
  TipoEmpleoModel.fromMap(Map<String, dynamic> map) {
    TipoEmpleo = map['TipoEmpleo'];
  }
}