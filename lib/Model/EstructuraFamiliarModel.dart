class EstructuraFamilarModel {
  int folio;
  String nombre;
  String primerApellido;
  String segundoApellido;
  String sexo;
  String fechaNacimiento;
  String entidadNacimiento;
  String claveestadoCivil;
  String ordenEstadoCivil;
  String estadoCivil;
  String claveParentesco;
  String ordenParentesco;
  String parentesco;

  EstructuraFamilarModel({
    this.folio,
    this.nombre,
    this.primerApellido,
    this.segundoApellido,
    this.sexo,
    this.fechaNacimiento,
    this.entidadNacimiento,
    this.claveestadoCivil,
    this.ordenEstadoCivil,
    this.estadoCivil,
    this.claveParentesco,
    this.ordenParentesco,
    this.parentesco});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'nombre': nombre,
      'primerApellido': primerApellido,
      'segundoApellido': segundoApellido,
      'sexo': sexo,
      'fechaNacimiento': fechaNacimiento,
      'entidadNacimiento': entidadNacimiento,
      'claveestadoCivil': claveestadoCivil,
      'ordenEstadoCivil': ordenEstadoCivil,
      'estadoCivil': estadoCivil,
      'claveParentesco': claveParentesco,
      'ordenParentesco': ordenParentesco,
      'parentesco': parentesco
    };
    return map;
  }

  EstructuraFamilarModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    nombre = map['nombre'];
    primerApellido = map['primerApellido'];
    segundoApellido = map['segundoApellido'];
    sexo = map['sexo'];
    fechaNacimiento = map['fechaNacimiento'];
    entidadNacimiento = map['entidadNacimiento'];
    estadoCivil = map['estadoCivil'];
    parentesco = map['parentesco'];
  }
}