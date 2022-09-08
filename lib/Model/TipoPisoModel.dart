class TipoPisoModel{

  String TipoPiso;

  TipoPisoModel({this.TipoPiso});

  Map<String, dynamic> toMap(){
    return {
      'TipoPiso' : TipoPiso
    };
  }

  TipoPisoModel.fromMap(Map<String, dynamic> map){
    TipoPiso = map['TipoPiso'];
  }
}