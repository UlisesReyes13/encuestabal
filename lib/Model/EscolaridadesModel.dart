class EscolaridadesModel{
  String escolaridad;

  EscolaridadesModel({this.escolaridad});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': escolaridad
    };
  }
  EscolaridadesModel.fromMap(Map<String, dynamic> map) {
    escolaridad = map['escolaridad'];

  }
}