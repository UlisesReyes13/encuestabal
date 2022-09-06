class AdiccionesModel {
  String Adiccion;

  AdiccionesModel({this.Adiccion});

  Map<String, dynamic> toMap(){
    return{
      'Adiccion' : Adiccion
    };
  }

  AdiccionesModel.fromMap(Map<String, dynamic> map){
    Adiccion = map['Adiccion'];
  }
}