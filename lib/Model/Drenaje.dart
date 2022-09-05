class Drenaje{
  String folio;
  int claveServSanitario ;
  String ordenServSanitario ;
  String servSanitario ;

  Drenaje({this.folio,this.claveServSanitario, this.ordenServSanitario, this.servSanitario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'claveServSanitario': claveServSanitario,
      'ordenServSanitario': ordenServSanitario,
      'servSanitario': servSanitario
    };
    return map;
  }

  Drenaje.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    claveServSanitario = map['claveServSanitario'];
    ordenServSanitario = map['ordenServSanitario'];
    servSanitario = map['servSanitario'];
  }
}
