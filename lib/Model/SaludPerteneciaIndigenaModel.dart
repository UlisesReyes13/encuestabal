class SaludPerteneciaIndigenaModel{
  int folio;
  String ClaveCapacidadDiferente;
  String OrdenCapacidadDiferente;
  String CapacidadDiferente;
  String ClaveCondicionesSalud;
  String OrdenCondicionesSalud;
  String CondicionesSalud;
  String ClaveAdiccion;
  String OrdenAdiccion;
  String Adiccion;
  int peso;
  int talla;
  double imc;
  String ClaveEtniaIndigena;
  String OrdenEtniaIndigena;
  String EtniaIndigena;

  SaludPerteneciaIndigenaModel({
      this.folio,
      this.ClaveCapacidadDiferente,
      this.OrdenCapacidadDiferente,
      this.CapacidadDiferente,
      this.ClaveCondicionesSalud,
      this.OrdenCondicionesSalud,
      this.CondicionesSalud,
      this.ClaveAdiccion,
      this.OrdenAdiccion,
      this.Adiccion,
      this.peso,
      this.talla,
      this.imc,
      this.ClaveEtniaIndigena,
      this.OrdenEtniaIndigena,
      this.EtniaIndigena});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'ClaveCapacidadDiferente': ClaveCapacidadDiferente,
      'OrdenCapacidadDiferente': OrdenCapacidadDiferente,
      'CapacidadDiferente': CapacidadDiferente,
      'ClaveCondicionesSalud': ClaveCondicionesSalud,
      'OrdenCondicionesSalud': OrdenCondicionesSalud,
      'CondicionesSalud': CondicionesSalud,
      'ClaveAdiccion': ClaveAdiccion,
      'OrdenAdiccion': OrdenAdiccion,
      'Adiccion': Adiccion,
      'peso': peso,
      'talla': talla,
      'imc': imc,
      'ClaveEtniaIndigena': ClaveEtniaIndigena,
      'OrdenEtniaIndigena': OrdenEtniaIndigena,
      'EtniaIndigena': EtniaIndigena,
    };
    return map;
  }

  SaludPerteneciaIndigenaModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    ClaveCapacidadDiferente = map['ClaveCapacidadDiferente'];
    OrdenCapacidadDiferente = map['OrdenCapacidadDiferente'];
    CapacidadDiferente = map['CapacidadDiferente'];
    ClaveCondicionesSalud = map['ClaveCondicionesSalud'];
    OrdenCondicionesSalud = map['OrdenCondicionesSalud'];
    CondicionesSalud = map['CondicionesSalud'];
    ClaveAdiccion = map['ClaveAdiccion'];
    OrdenAdiccion = map['OrdenAdiccion'];
    Adiccion = map['Adiccion'];
    peso = map['peso'];
    talla = map['talla'];
    imc = map['imc'];
    ClaveEtniaIndigena = map['ClaveEtniaIndigena'];
    OrdenEtniaIndigena = map['OrdenEtniaIndigena'];
    EtniaIndigena = map['EtniaIndigena'];
  }
}