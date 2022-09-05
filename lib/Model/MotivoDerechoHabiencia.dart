class MotivoDerechoHabienciasModel{
  String motivoDerechoHabiencia;

  MotivoDerechoHabienciasModel({this.motivoDerechoHabiencia});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': motivoDerechoHabiencia
    };
  }
  MotivoDerechoHabienciasModel.fromMap(Map<String, dynamic> map) {
    motivoDerechoHabiencia = map['motivoDerechoHabiencia'];
  }
}