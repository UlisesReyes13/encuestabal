class Luz{
  String folio;
  int claveServLuz ;
  String ordenServLuz ;
  String servLuz ;

  Luz({this.folio,this.claveServLuz, this.ordenServLuz, this.servLuz});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'claveServLuz': claveServLuz,
      'ordenServLuz': ordenServLuz,
      'servLuz': servLuz
    };
    return map;
  }

  Luz.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    claveServLuz = map['claveServLuz'];
    ordenServLuz = map['ordenServLuz'];
    servLuz = map['servLuz'];
  }

}
