class TipoEmpleoModel {
  String tipoEmpleo;

  TipoEmpleoModel({this.tipoEmpleo});

  Map<String, dynamic> toMap() {
    return {
      'grado': tipoEmpleo
    };
  }
  TipoEmpleoModel.fromMap(Map<String, dynamic> map) {
    tipoEmpleo = map['ocupacion'];
  }
}