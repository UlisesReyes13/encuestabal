class Parentescos{
  String Parentesco;

  Parentescos({this.Parentesco});

Map<String, dynamic> toMap(){
  return {
    'Parentesco' : Parentesco
    };
  }

  Parentescos.fromMap(Map<String, dynamic> map){
  Parentesco = map['Parentesco'];
  }
}