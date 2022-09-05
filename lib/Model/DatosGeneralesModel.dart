class DatosGeneralesModel {

  int folio ;
  String fechaCaptura;
  String calle ;
  String entreCalles ;
  String grupo ;
  String noExt ;
  String noInt ;
  String fecha ;
  String localidad;
  String telefono;
  int claveCodigoPostal;
  int claveEstado;
  String estado;
  String nombreComunidad;

  int claveMunicipio;
  String municipio;

  int claveAsentamiento;
  String nombreAsentamiento;

  int claveTipoAsentamiento;
  int ordentipoAsentamiento;
  String tipoAsentamiento;

  int claveTipoVialidad;
  int ordentipovialidad;
  String tipoVialidad;


  DatosGeneralesModel({
      this.folio,
      this.fechaCaptura,
      this.calle,
      this.entreCalles,
      this.grupo,
      this.noExt,
      this.noInt,
      this.fecha,
      this.localidad,
      this.telefono,
      this.claveCodigoPostal,
      this.claveEstado,
      this.estado,
      this.nombreComunidad,

      this.claveMunicipio,
      this.municipio,

      this.claveAsentamiento,
      this.nombreAsentamiento,

      this.claveTipoAsentamiento,
      this.ordentipoAsentamiento,
      this.tipoAsentamiento,

      this.claveTipoVialidad,
      this.ordentipovialidad,
      this.tipoVialidad});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      'folio': folio,
      'fechaCaptura': fechaCaptura,
      'calle': calle,
      'entreCalles': entreCalles,
      'grupo': grupo,
      'noExt': noExt,
      'noInt': noInt,
      'fecha': fecha,
      'localidad': localidad,
      'telefono': telefono,
      'claveCodigoPostal': claveCodigoPostal,
      'claveEstado': claveEstado,
      'estado': estado,
      'nombreComunidad': nombreComunidad,

      'claveMunicipio': claveMunicipio,
      'municipio': municipio,

      'claveAsentamiento': claveAsentamiento,
      'nombreAsentamiento': nombreAsentamiento,


      'claveTipoAsentamiento': claveTipoAsentamiento,
      'ordentipoAsentamiento': ordentipoAsentamiento,
      'tipoAsentamiento': tipoAsentamiento,

      'claveTipoVialidad': claveTipoVialidad,
      'ordentipovialidad': ordentipovialidad,
      'tipoVialidad': tipoVialidad,


    };
    return map;
  }

  DatosGeneralesModel.fromMap(Map<String, dynamic> map) {

    folio = map['folio'];
    fechaCaptura = map['fechaCaptura'];
    calle = map['calle'];
    entreCalles = map['entreCalles'];
    grupo = map['grupo'];
    noExt = map['noExt'];
    noInt = map['noInt'];
    fecha = map['fecha'];
    localidad = map['localidad'];
    telefono = map['telefono'];
    claveCodigoPostal = map['claveCodigoPostal'];
    claveEstado = map['claveEstado'];
    estado = map['estado'];
    nombreComunidad = map['nombreComunidad'];

    claveMunicipio = map['claveMunicipio'];
    municipio = map['municipio'];

    claveAsentamiento = map['claveAsentamiento'];
    nombreAsentamiento = map['nombreAsentamiento'];


    claveTipoAsentamiento = map['claveTipoAsentamiento'];
    ordentipoAsentamiento = map['ordentipoAsentamiento'];
    tipoAsentamiento = map['tipoAsentamiento'];

    claveTipoVialidad = map['claveTipoVialidad'];
    ordentipovialidad = map['ordentipovialidad'];
    tipoVialidad = map['tipoVialidad'];



  }
}