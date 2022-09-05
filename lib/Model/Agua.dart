class Agua{
  String folio;
  int claveServAgua ;
  String ordenServAgua ;
  String servAgua ;

  Agua({this.folio,this.claveServAgua, this.ordenServAgua, this.servAgua});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'claveServAgua': claveServAgua,
      'ordenServAgua': ordenServAgua,
      'servAgua': servAgua
    };
    return map;
  }

  Agua.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    claveServAgua = map['claveServAgua'];
    ordenServAgua = map['ordenServAgua'];
    servAgua = map['servAgua'];
  }

}
