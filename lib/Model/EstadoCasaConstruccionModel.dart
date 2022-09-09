class EstadoCasaConstruccionModel{
  int folio;

  String ClaveTipoVivienda;
  String OrdenTipoVivienda;
  String TipoVivienda;

  String ClaveTipoPiso;
  String OrdenTipoPiso;
  String TipoPiso;

  String ClaveTenencia;
  String OrdenTenencia;
  String Tenencia;

  String ClaveTecho;
  String OrdenTecho;
  String Techo;

  String ClaveTipoMuro;
  String OrdenTipoMuro;
  String TipoMuro;

  EstadoCasaConstruccionModel({
      this.folio,

      this.ClaveTipoVivienda,
      this.OrdenTipoVivienda,
      this.TipoVivienda,

      this.ClaveTipoPiso,
      this.OrdenTipoPiso,
      this.TipoPiso,

      this.ClaveTenencia,
      this.OrdenTenencia,
      this.Tenencia,

      this.ClaveTecho,
      this.OrdenTecho,
      this.Techo,

      this.ClaveTipoMuro,
      this.OrdenTipoMuro,
      this.TipoMuro});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,

      'ClaveTipoVivienda': ClaveTipoVivienda,
      'OrdenTipoVivienda': OrdenTipoVivienda,
      'TipoVivienda': TipoVivienda,

      'ClaveTipoPiso': ClaveTipoPiso,
      'OrdenTipoPiso': OrdenTipoPiso,
      'TipoPiso': TipoPiso,

      'ClaveTenencia': ClaveTenencia,
      'OrdenTenencia': OrdenTenencia,
      'Tenencia': Tenencia,

      'ClaveTecho': ClaveTecho,
      'OrdenTecho': OrdenTecho,
      'Techo': Techo,

      'ClaveTipoMuro': ClaveTipoMuro,
      'OrdenTipoMuro': OrdenTipoMuro,
      'TipoMuro': TipoMuro,
    };
    return map;
  }

  EstadoCasaConstruccionModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];

    ClaveTipoVivienda = map['ClaveTipoVivienda'];
    OrdenTipoVivienda = map['OrdenTipoVivienda'];
    TipoVivienda = map['TipoVivienda'];

    ClaveTipoPiso = map['ClaveTipoPiso'];
    OrdenTipoPiso = map['OrdenTipoPiso'];
    TipoPiso = map['TipoPiso'];

    ClaveTenencia = map['ClaveTenencia'];
    OrdenTenencia = map['OrdenTenencia'];
    Tenencia = map['Tenencia'];

    ClaveTecho = map['ClaveTecho'];
    OrdenTecho = map['OrdenTecho'];
    Techo = map['Techo'];

    ClaveTipoMuro = map['ClaveTipoMuro'];
    OrdenTipoMuro = map['OrdenTipoMuro'];
    TipoMuro = map['TipoMuro'];
  }

}