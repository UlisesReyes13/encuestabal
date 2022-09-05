  class OcupacionesModel {
  String ocupacion;

  OcupacionesModel({this.ocupacion});

  Map<String, dynamic> toMap() {
    return {
      'grado': ocupacion
    };
  }
  OcupacionesModel.fromMap(Map<String, dynamic> map) {
    ocupacion = map['ocupacion'];
  }
}