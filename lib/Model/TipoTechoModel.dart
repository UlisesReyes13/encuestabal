class TipoTechoModel{
  String Techo;

  TipoTechoModel({this.Techo});

  Map<String, dynamic> toMap(){
   return {
     'Techo' : Techo
   };
  }

  TipoTechoModel.fromMap(Map<String, dynamic>map){
    Techo = map['Techo'];
  }
}