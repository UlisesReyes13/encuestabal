class CaracteristicasCasa{
  int folio;
  String numCuartos;
  String cuartosDormir;
  String cocinaSeparada;
  String cuartoBanioExclusivo;

  CaracteristicasCasa({this.folio, this.numCuartos, this.cuartosDormir,
      this.cocinaSeparada, this.cuartoBanioExclusivo});

  Map<String, dynamic> toMap(){
    return{
      'folio' : folio,
      'numCuartos' : numCuartos,
      'cuartosDormir' : cuartosDormir,
      'cocinaSeparada' : cocinaSeparada,
      'cuartoBanioExclusivo' : cuartoBanioExclusivo
    };
  }

  CaracteristicasCasa.fromMap(Map<String, dynamic> map){
    folio = map['folio'];
    numCuartos = map['numCuartos'];
    cuartosDormir = map['cuartosDormir'];
    cocinaSeparada = map['cocinaSeparada'];
    cuartoBanioExclusivo = map['cuartoBanioExclusivo'];
  }
}