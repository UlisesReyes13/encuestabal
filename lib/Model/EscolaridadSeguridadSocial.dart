class EscolaridadSeguridadSocial{
  int folio;
  String ClaveEscolaridad;
  String OrdenEscolaridad;
  String Escolaridad;
  String ClaveGradoEscolar;
  String GradoEscolar;
  String ClaveAsisteEscuela;
  String OrdenAsisteEscuela;
  String AsisteEscuela;
  String ClaveOcupacion;
  String OrdenOcupacion;
  String Ocupacion;
  String ClaveTipoEmpleo;
  String OrdenTipoEmpleo;
  String TipoEmpleo;
  String pk_prestacioneslab;
  String int_OrdenPrestacionesLab;
  String txt_desc_prestacioneslab;
  String ClaveJubilacion;
  String OrdenJubilacion;
  String Jubilacion;
  String ClaveDerechohabiencia;
  String OrdenDerechohabiencia;
  String Derechohabiencia;
  String ClaveMotivoDerechohabiencia;
  String OrdenMotivoDerechohabiencia;
  String MotivoDerechohabiencia;

  EscolaridadSeguridadSocial({
      this.folio,

      this.ClaveEscolaridad,
      this.OrdenEscolaridad,
      this.Escolaridad,

      this.ClaveGradoEscolar,
      this.GradoEscolar,

      this.ClaveAsisteEscuela,
      this.OrdenAsisteEscuela,
      this.AsisteEscuela,

      this.ClaveOcupacion,
      this.OrdenOcupacion,
      this.Ocupacion,

      this.ClaveTipoEmpleo,
      this.OrdenTipoEmpleo,
      this.TipoEmpleo,

      this.pk_prestacioneslab,
      this.int_OrdenPrestacionesLab,
      this.txt_desc_prestacioneslab,

      this.ClaveJubilacion,
      this.OrdenJubilacion,
      this.Jubilacion,

      this.ClaveDerechohabiencia,
      this.OrdenDerechohabiencia,
      this.Derechohabiencia,

      this.ClaveMotivoDerechohabiencia,
      this.OrdenMotivoDerechohabiencia,
      this.MotivoDerechohabiencia});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,

      'ClaveEscolaridad': ClaveEscolaridad,
      'OrdenEscolaridad': OrdenEscolaridad,
      'Escolaridad': Escolaridad,

      'ClaveGradoEscolar': ClaveGradoEscolar,
      'GradoEscolar': GradoEscolar,

      'ClaveAsisteEscuela': ClaveAsisteEscuela,
      'OrdenAsisteEscuela': OrdenAsisteEscuela,
      'AsisteEscuela': AsisteEscuela,

      'ClaveOcupacion': ClaveOcupacion,
      'OrdenOcupacion': OrdenOcupacion,
      'Ocupacion': Ocupacion,

      'ClaveTipoEmpleo': ClaveTipoEmpleo,
      'OrdenTipoEmpleo': OrdenTipoEmpleo,
      'TipoEmpleo': TipoEmpleo,

      'pk_prestacioneslab': pk_prestacioneslab,
      'int_OrdenPrestacionesLab': int_OrdenPrestacionesLab,
      'txt_desc_prestacioneslab': txt_desc_prestacioneslab,

      'ClaveJubilacion' : ClaveJubilacion,
      'OrdenJubilacion' : OrdenJubilacion,
      'Jubilacion': Jubilacion,

      'ClaveDerechohabiencia': ClaveDerechohabiencia,
      'OrdenDerechohabiencia': OrdenDerechohabiencia,
      'Derechohabiencia': Derechohabiencia,

      'ClaveMotivoDerechohabiencia': ClaveMotivoDerechohabiencia,
      'OrdenMotivoDerechohabiencia': OrdenMotivoDerechohabiencia,
      'MotivoDerechohabiencia': MotivoDerechohabiencia,

    };
    return map;
  }

  EscolaridadSeguridadSocial.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];

    ClaveEscolaridad = map['ClaveEscolaridad'];
    OrdenEscolaridad = map['OrdenEscolaridad'];
    Escolaridad = map['Escolaridad'];

    ClaveGradoEscolar = map['ClaveGradoEscolar'];
    GradoEscolar = map['GradoEscolar'];

    ClaveAsisteEscuela = map['ClaveAsisteEscuela'];
    OrdenAsisteEscuela = map['OrdenAsisteEscuela'];
    AsisteEscuela = map['AsisteEscuela'];

    ClaveOcupacion = map['ClaveOcupacion'];
    OrdenOcupacion = map['OrdenOcupacion'];
    Ocupacion = map['Ocupacion'];

    ClaveTipoEmpleo = map['ClaveTipoEmpleo'];
    OrdenTipoEmpleo = map['OrdenTipoEmpleo'];
    TipoEmpleo = map['TipoEmpleo'];

    pk_prestacioneslab = map['pk_prestacioneslab'];
    int_OrdenPrestacionesLab = map['int_OrdenPrestacionesLab'];
    txt_desc_prestacioneslab = map['txt_desc_prestacioneslab'];

    ClaveJubilacion = map['ClaveJubilacion'];
    OrdenJubilacion = map['OrdenJubilacion'];
    Jubilacion = map['Jubilacion'];

    ClaveDerechohabiencia = map['ClaveDerechohabiencia'];
    OrdenDerechohabiencia = map['OrdenDerechohabiencia'];
    Derechohabiencia = map['Derechohabiencia'];

    ClaveMotivoDerechohabiencia = map['ClaveMotivoDerechohabiencia'];
    OrdenMotivoDerechohabiencia = map['OrdenMotivoDerechohabiencia'];
    MotivoDerechohabiencia = map['MotivoDerechohabiencia'];
  }
}