class PuebloIndigenaModel{

  String EtniaIndigena;

  PuebloIndigenaModel({this.EtniaIndigena});

  Map<String, dynamic> toMap(){
    return {
      'EtniaIndigena' : EtniaIndigena
    };
  }

  PuebloIndigenaModel.fromMap(Map<String, dynamic> map){
    EtniaIndigena = map['EtniaIndigena'];
  }
}