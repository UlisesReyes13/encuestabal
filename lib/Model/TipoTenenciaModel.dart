class TipoTenenciaModel{

  String Tenencia;

  TipoTenenciaModel({this.Tenencia});

  Map<String, dynamic>toMap(){
    return {
      'Tenencia' : Tenencia
    };
  }

  TipoTenenciaModel.fromMap(Map<String, dynamic> map){
    Tenencia = map['Tenencia'];
  }

}