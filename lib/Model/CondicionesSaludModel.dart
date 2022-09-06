class CondicioneSaludModel{
  String CondicionesSalud;

  CondicioneSaludModel({this.CondicionesSalud});

  Map<String, dynamic> toMap(){
    return {
      'CondicionesSalud' : CondicionesSalud
    };
  }

  CondicioneSaludModel.fromMap(Map<String, dynamic> map){
    CondicionesSalud = map['CondicionesSalud'];
  }
}