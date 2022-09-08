class TipoMuroModel{

  String TipoMuro;

  TipoMuroModel({this.TipoMuro});

  Map<String, dynamic> toMap(){
    return{
      'TipoMuro' : TipoMuro
    };
  }

  TipoMuroModel.fromMap(Map<String, dynamic>map){
    TipoMuro = map['TipoMuro'];
  }

}