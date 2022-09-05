class EstadosCiviles{
  String EstadoCivil;

  EstadosCiviles({this.EstadoCivil});

  Map<String, dynamic> toMap(){
    return {
      'EstadoCivil' : EstadoCivil
    };
  }

  EstadosCiviles.fromMap(Map<String, dynamic> map){
    EstadoCivil = map['EstadoCivil'];
  }

}