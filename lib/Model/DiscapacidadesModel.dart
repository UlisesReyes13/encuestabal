class CapacidadesDiferentes {
  String CapacidadDiferente;

  CapacidadesDiferentes({this.CapacidadDiferente});

  Map<String, dynamic> toMap(){
    return {
      'CapacidadDiferente' : CapacidadDiferente
    };
  }

  CapacidadesDiferentes.fromMap(Map<String, dynamic> map){
    CapacidadDiferente = map['CapacidadDiferente'];
  }
}