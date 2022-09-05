class DerechoHabienciasModel{
  String derechoHabiencia;

  DerechoHabienciasModel({this.derechoHabiencia});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': derechoHabiencia
    };
  }
  DerechoHabienciasModel.fromMap(Map<String, dynamic> map) {
    derechoHabiencia = map['derechoHabiencia'];

  }
}