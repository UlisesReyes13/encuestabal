class Banio{
  String folio;
  int pk_bano ;
  String int_orden_bano ;
  String txt_desc_bano ;

  Banio({this.folio,this.pk_bano, this.int_orden_bano, this.txt_desc_bano});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'pk_bano': pk_bano,
      'int_orden_bano': int_orden_bano,
      'txt_desc_bano': txt_desc_bano
    };
    return map;
  }

  Banio.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    pk_bano = map['pk_bano'];
    int_orden_bano = map['int_orden_bano'];
    txt_desc_bano = map['txt_desc_bano'];
  }

}