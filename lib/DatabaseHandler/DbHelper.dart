import 'dart:developer';

import 'package:encuestabal/Model/Agua.dart';
import 'package:encuestabal/Model/CaracteristicasCasa.dart';
import 'package:encuestabal/Model/Drenaje.dart';
import 'package:encuestabal/Model/EscolaridadSeguridadSocial.dart';
import 'package:encuestabal/Model/EstadoCasaConstruccionModel.dart';
import 'package:encuestabal/Model/EstructuraFamiliarModel.dart';
import 'package:encuestabal/Model/Gas.dart';
import 'package:encuestabal/Model/Luz.dart';
import 'package:encuestabal/Model/NombreAsentamiento.dart';
import 'package:encuestabal/Model/SaludPerteneciaIndigenaModel.dart';
import 'package:encuestabal/Model/UserModel.dart';
import 'package:encuestabal/Model/banio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:encuestabal/Model/DatosGeneralesModel.dart';

class DbHelper {
  static Database _db;

  static const String DB_Name = 'encuesta.db';
  static const String Table_User = 'usuario';
  static const String Table_Data = 'datosGenerales';
  static const String Table_Servicios = 'servicios';
  static const String Table_DatosFamiliares= 'estructuraFamiliar';
  static const String Table_Escolaridad= 'escolaridadSeguridadSocial';
  static const String Table_Salud= 'saludPertenenciaIndigena';
  static const String Table_Vivienda = 'estadoDeLaCasaYConstruccion';
  static const String Table_Casa = 'caracteristicas_Casa';

  static const int Version = 3;

  static const String C_idUsuario = 'idUsuario';
  static const String C_NombreUsuario = 'nombreUsuario';
  static const String C_Nombre = 'nombre';
  static const String C_ApellidoP = 'apellidoP';
  static const String C_ApellidoM = 'apellidoM';
  static const String C_Rol = 'rol';
  static const String C_Password = 'password';

  static const String C_Folio = 'folio';
  static const String C_FechaCaptura = 'fechaCaptura';
  static const String C_Calle = 'calle';
  static const String C_EntreCalles = 'entreCalles';
  static const String C_Grupo = 'grupo';
  static const String C_NoExt = 'noExt';
  static const String C_NoInt = 'noInt';
  static const String C_Fecha = 'fecha';
  static const String C_Localidad = 'localidad';
  static const String C_Telefono = 'telefono';
  static const String C_CP = 'claveCodigoPostal';
  static const String C_ClaveEstado = 'claveEstado';
  static const String C_Estado = 'estado';
  static const String C_NombreComunidad = 'nombreComunidad';

  static const String C_ClaveMunicipio = 'claveMunicipio';
  static const String C_Municipio = 'municipio';

  static const String C_ClaveTipoAsentamiento = 'claveTipoAsentamiento';
  static const String C_OrdenTipoAsentamiento = 'ordenTipoAsentamiento';
  static const String C_TipoAsentamiento = 'tipoAsentamiento';

  static const String C_ClaveAsentamiento = 'claveAsentamiento';
  static const String C_NombreAsentamiento = 'nombreAsentamiento';

  static const String C_ClaveTipoVialidad = 'claveTipoVialidad';
  static const String C_OrdenTipoVialidad = 'ordenTipoVialidad';
  static const String C_TipoVialidad = 'tipoVialidad';

  //Tabla Servicios
  static const String C_pk_bano = 'pk_bano';
  static const String C_int_orden_bano = 'int_orden_bano';
  static const String C_txt_desc_bano = 'txt_desc_bano';
  static const String C_ClaveServAgua = 'claveServAgua';
  static const String C_OrdenServAgua = 'ordenServAgua';
  static const String C_ServAgua = 'servAgua';
  static const String C_ClaveServGas = 'claveServGas';
  static const String C_OrdenServGas = 'ordenServGas';
  static const String C_ServGas = 'servGas';
  static const String C_ClaveServLuz = 'claveServLuz';
  static const String C_OrdenServLuz = 'ordenServLuz';
  static const String C_ServLuz = 'servLuz';
  static const String C_ClaveServSanitario = 'claveServSanitario';
  static const String C_OrdenServSanitario = 'ordenServSanitario';
  static const String C_ServSanitario = 'servSanitario';

  //Tabla estructura Familiar
  static const String C_Nombres = 'nombre';
  static const String C_PrimerApellido = 'primerApellido';
  static const String C_SegundoApellido = 'segundoApellido';
  static const String C_Sexo = 'sexo';
  static const String C_FechaNacimiento = 'fechaNacimiento';
  static const String C_EntidadNacimiento = 'entidadNacimiento';
  static const String C_ClaveEstadoCivil = 'claveEstadoCivil';
  static const String C_OrdenEstadoCivil = 'ordenEstadoCivil';
  static const String C_EstadoCivil = 'estadoCivil';
  static const String C_ClaveParentesco = 'claveParentesco';
  static const String C_OrdenParentesco = 'OrdenParentesco';
  static const String C_Parentesco = 'parentesco';

  //Tabla escolaridad seguridad social
  static const String C_ClaveEscolaridad = 'ClaveEscolaridad';
  static const String C_OrdenEscolaridad = 'OrdenEscolaridad';
  static const String C_Escolaridad = 'Escolaridad';
  static const String C_ClaveGradoEscolar = 'ClaveGradoEscolar';
  static const String C_GradoEscolar = 'GradoEscolar';
  static const String C_ClaveAsisteEscuela = 'ClaveAsisteEscuela';
  static const String C_OrdenAsisteEscuela = 'OrdenAsisteEscuela';
  static const String C_AsisteEscuela = 'AsisteEscuela';
  static const String C_ClaveOcupacion = 'ClaveOcupacion';
  static const String C_OrdenOcupacion = 'OrdenOcupacion';
  static const String C_Ocupacion = 'Ocupacion';
  static const String C_ClaveTipoEmpleo = 'ClaveTipoEmpleo';
  static const String C_OrdenTipoEmpleo = 'OrdenTipoEmpleo';
  static const String C_TipoEmpleo = 'TipoEmpleo';
  static const String C_pk_prestacioneslab = 'pk_prestacioneslab';
  static const String C_int_OrdenPrestacionesLab = 'int_OrdenPrestacionesLab';
  static const String C_txt_desc_prestacioneslab = 'txt_desc_prestacioneslab';
  static const String C_ClaveJubilacion = 'ClaveJubilacion';
  static const String C_OrdenJubilacion = 'OrdenJubilacion';
  static const String C_Jubilacion = 'Jubilacion';
  static const String C_ClaveDerechohabiencia = 'ClaveDerechohabiencia';
  static const String C_OrdenDerechohabiencia = 'OrdenDerechohabiencia';
  static const String C_Derechohabiencia = 'Derechohabiencia';
  static const String C_ClaveMotivoDerechohabiencia = 'ClaveMotivoDerechohabiencia';
  static const String C_OrdenMotivoDerechohabiencia = 'OrdenMotivoDerechohabiencia';
  static const String C_MotivoDerechohabiencia = 'MotivoDerechohabiencia';

  //Tabla Salud Pertenencia Indigena
  static const String C_ClaveCapacidadDiferente = 'claveCapacidadDiferente';
  static const String C_OrdenCapacidadDiferente = 'ordenCapacidadDiferente';
  static const String C_CapacidadDiferente = 'capacidadDiferente';
  static const String C_ClaveCondicionesSalud = 'claveCondicionesSalud';
  static const String C_OrdenCondicionesSalud = 'ordenCondicionesSalud';
  static const String C_CondicionesSalud = 'condicionesSalud';
  static const String C_ClaveAdiccion = 'claveAdiccion';
  static const String C_OrdenAdiccion = 'ordenAdiccion';
  static const String C_Adiccion = 'adiccion';
  static const String C_peso = 'peso';
  static const String C_talla = 'talla';
  static const String C_imc = 'imc';
  static const String C_ClaveEtniaIndigena = 'claveEtniaIndigena';
  static const String C_OrdenEtniaIndigena = 'ordenEtniaIndigena';
  static const String C_EtniaIndigena = 'etniaIndigena';

  //Tabla Estado de la casa y construcion
  static const String C_ClaveTipoVivienda = 'ClaveTipoVivienda';
  static const String C_OrdenTipoVivienda = 'OrdenTipoVivienda';
  static const String C_TipoVivienda = 'TipoVivienda';
  static const String C_ClaveTipoPiso = 'ClaveTipoPiso';
  static const String C_OrdenTipoPiso = 'OrdenTipoPiso';
  static const String C_TipoPiso = 'TipoPiso';
  static const String C_ClaveTenencia = 'ClaveTenencia';
  static const String C_OrdenTenencia = 'OrdenTenencia';
  static const String C_Tenencia = 'Tenencia';
  static const String C_ClaveTecho = 'ClaveTecho';
  static const String C_OrdenTecho = 'OrdenTecho';
  static const String C_Techo = 'Techo';
  static const String C_ClaveTipoMuro = 'ClaveTipoMuro';
  static const String C_OrdenTipoMuro = 'OrdenTipoMuro';
  static const String C_TipoMuro = 'TipoMuro';

  //Tabla Estado de la casa y construcion
  static const String C_numCuartos = 'numCuartos';
  static const String C_cuartosDormir = 'cuartosDormir';
  static const String C_cocinaSeparada = 'cocinaSeparada';
  static const String C_cuartoBanioExclusivo = 'cuartoBanioExclusivo';


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ( $C_idUsuario INTEGER not null primary key AUTOINCREMENT , $C_NombreUsuario TEXT, $C_Nombre TEXT, $C_ApellidoP TEXT,$C_ApellidoM TEXT,$C_Rol TEXT,$C_Password TEXT);");
    await db.execute("CREATE TABLE $Table_Data ($C_Folio INTEGER not null Primary key AUTOINCREMENT ,$C_FechaCaptura TEXT, $C_Calle TEXT, $C_EntreCalles TEXT, $C_Grupo TEXT,$C_NoExt TEXT,$C_NoInt TEXT,$C_Fecha TEXT,$C_Localidad TEXT,$C_Telefono TEXT,$C_CP TEXT,$C_ClaveEstado TEXT,$C_Estado TEXT, $C_NombreComunidad TEXT, $C_ClaveMunicipio TEXT,$C_Municipio TEXT,$C_ClaveAsentamiento TEXT,$C_NombreAsentamiento TEXT ,$C_ClaveTipoAsentamiento TEXT, $C_OrdenTipoAsentamiento TEXT, $C_TipoAsentamiento TEXT, $C_ClaveTipoVialidad TEXT, $C_OrdenTipoVialidad TEXT, $C_TipoVialidad TEXT);");
    await db.execute("CREATE TABLE $Table_Servicios ($C_Folio int, $C_pk_bano TEXT , $C_int_orden_bano TEXT, $C_txt_desc_bano TEXT, $C_ClaveServAgua TEXT, $C_OrdenServAgua TEXT, $C_ServAgua TEXT, $C_ClaveServGas TEXT, $C_OrdenServGas TEXT, $C_ServGas TEXT, $C_ClaveServLuz TEXT, $C_OrdenServLuz TEXT, $C_ServLuz TEXT, $C_ClaveServSanitario TEXT, $C_OrdenServSanitario TEXT, $C_ServSanitario TEXT);");
    await db.execute("CREATE TABLE $Table_DatosFamiliares ($C_Folio int, $C_Nombres TEXT, $C_PrimerApellido TEXT, $C_SegundoApellido TEXT, $C_Sexo TEXT, $C_FechaNacimiento TEXT, $C_EntidadNacimiento TEXT,$C_ClaveEstadoCivil TEXT ,$C_OrdenEstadoCivil TEXT,$C_EstadoCivil TEXT,$C_ClaveParentesco Text, $C_OrdenParentesco TEXT , $C_Parentesco TEXT);");
    await db.execute("CREATE TABLE $Table_Escolaridad ($C_Folio int, $C_ClaveEscolaridad TEXT, $C_OrdenEscolaridad TEXT, $C_Escolaridad TEXT,$C_ClaveGradoEscolar TEXT,$C_GradoEscolar TEXT,$C_ClaveAsisteEscuela TEXT,$C_OrdenAsisteEscuela TEXT,$C_AsisteEscuela TEXT,$C_ClaveOcupacion TEXT,$C_OrdenOcupacion TEXT,$C_Ocupacion TEXT,$C_ClaveTipoEmpleo TEXT,$C_OrdenTipoEmpleo TEXT,$C_TipoEmpleo TEXT,$C_pk_prestacioneslab TEXT,$C_int_OrdenPrestacionesLab TEXT,$C_txt_desc_prestacioneslab TEXT,$C_ClaveJubilacion TEXT,$C_OrdenJubilacion TEXT,$C_Jubilacion TEXT,$C_ClaveDerechohabiencia TEXT,$C_OrdenDerechohabiencia TEXT,$C_Derechohabiencia TEXT,$C_ClaveMotivoDerechohabiencia TEXT,$C_OrdenMotivoDerechohabiencia TEXT,$C_MotivoDerechohabiencia TEXT);");
    await db.execute("CREATE TABLE $Table_Salud ($C_Folio int,$C_ClaveCapacidadDiferente TEXT,$C_OrdenCapacidadDiferente TEXT,$C_CapacidadDiferente TEXT,$C_ClaveCondicionesSalud TEXT,$C_OrdenCondicionesSalud TEXT,$C_CondicionesSalud TEXT,$C_ClaveAdiccion TEXT,$C_OrdenAdiccion TEXT,$C_Adiccion TEXT,$C_peso int,$C_talla int,$C_imc double,$C_ClaveEtniaIndigena TEXT,$C_OrdenEtniaIndigena TEXT,$C_EtniaIndigena TEXT);");
    await db.execute("CREATE TABLE $Table_Vivienda ($C_Folio int,$C_ClaveTipoVivienda TEXT,$C_OrdenTipoVivienda TEXT,$C_TipoVivienda TEXT,$C_ClaveTipoPiso TEXT,$C_OrdenTipoPiso TEXT,$C_TipoPiso TEXT,$C_ClaveTenencia TEXT,$C_OrdenTenencia TEXT,$C_Tenencia TEXT,$C_ClaveTecho TEXT,$C_OrdenTecho TEXT,$C_Techo TEXT,$C_ClaveTipoMuro TEXT,$C_OrdenTipoMuro TEXT,$C_TipoMuro TEXT);");
    await db.execute("CREATE TABLE $Table_Casa ($C_Folio int,$C_numCuartos TEXT ,$C_cuartosDormir TEXT,$C_cocinaSeparada TEXT,$C_cuartoBanioExclusivo TEXT);");

    //NOMBRE ASENTAMIENTO
    await db.execute("CREATE TABLE Asentamientos (NombreAsentamientos TEXT);");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('1 HEROES DE LEON');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('2 FRACCIONAMIENTO DEL MORAL DOS');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('3 TIERRAS PRIETAS');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('4 JARDINES DE LAS LOMAS DE MEDINA');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('5 PASEO DE LA PRESA');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('6 REAL DE MARICHES');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('7 BALCONES DE JOYA');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('8 SAN IGNACIÓN');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('9 PASO DE LA MESA');");
    await db.execute("INSERT INTO Asentamientos (NombreAsentamientos) VALUES ('10 LOS ANGELES EL PEDERNAL');");

    //Tabla TiposVialidad
    await db.execute("CREATE TABLE TiposVialidad (TipoVialidad TEXT);");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('1 1 AMPLIACION');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('2 2 ANDADOR');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('3 3 AVENIDA');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('4 4 BOULEVARD');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('5 5 CALLE');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('6 6 CALLEJON');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('7 7 CALZADA');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('8 8 CERRADA');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('9 9 CIRCUITO');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('10 10 CIRCUNVALACION');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('11 11 CONTINUACION');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('12 12 CORREDOR');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('13 13 DIAGONAL');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('14 14 EJE VIAL');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('15 15 PASAJE');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('16 16 PEATONAL');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('17 17 PERIFERICO');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('18 18 PRIVADA');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('19 19 PROLONGACION');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('20 20 RETORNO');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('21 21 VIADUCTO');");
    await db.execute("INSERT INTO TiposVialidad (TipoVialidad) VALUES ('22 22 NINGUNO');");

    //Tabla MUNICIPIOS
    await db.execute("CREATE TABLE tb_Municipios(Municipio TEXT)");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('1 Manuel Doblado');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('2 Ojuelos de Jalisco');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('3 Romita');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('4 Salamanca');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('5 Huejuquilla el Alto');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('6 Ocampo');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('7 Silao de la Victoria');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('8 Huanímaro');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('9 San Miguel de Allende');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('10 San Diego de la Unión');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('11 Pénjamo');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('12 San Felipe');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('13 Tierra Blanca');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('14 Cuerámaro');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('15 Jerécuaro');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('16 Irapuato');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('17 Tepatitlán de Morelos');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('18 San Pedro Tlaquepaque');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('19 Dolores Hidalgo Cuna de la Independencia Nacional');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('20 Lagos de Moreno');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('21 Guanajuato');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('22 León');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('23 Purísima del Rincón');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('24 Doctor Mora');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('25 Unión de San Antonio');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('26 Poncitlán');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('27 Abasolo');");
    await db.execute("INSERT INTO tb_Municipios (Municipio) VALUES ('28 San Francisco del Rincón');");

    //TABLA TIPOS ASENTAMIENTO
    await db.execute("CREATE TABLE TiposAsentamiento (TipoAsentamiento TEXT);");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('1 1 AEREOPUERTO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('2 2 AMPLIACION');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('3 3 BARRIO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('4 4 CANTON');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('5 5 CIUDAD');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('6 6 INDUSTRIAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('7 7 COLONIA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('8 8 CONDOMINIO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('9 9 CONJUNTO HABITACIONAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('10 10 CORREDOR INDUSTRIAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('11 11 COTO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('12 12 CUARTEL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('13 13 EJIDO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('14 14 EX HACIENDA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('15 15 FRACCION');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('16 16 FRACCIONAMIENTO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('17 17 GRANJA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('18 18 HACIENDA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('19 19 INGENIO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('20 20 MANZANA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('21 21 PARAJE');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('22 22 PARQUE INDUSTRIAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('23 23 PRIVADA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('24 24 PROLONGACION');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('25 25 PUEBLO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('26 26 PUERTO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('27 27 RANCHERIA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('28 28 RANCHO');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('29 29 REGION');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('30 30 RESIDENCIAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('31 31 RINCONADA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('32 32 SECCION');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('33 33 SECTOR');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('34 34 SUPERMANZANA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('35 35 UNIDAD');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('36 36 UNIDADES HABITACIONALES');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('37 37 VILLA');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('38 38 ZONA FEDERAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('39 39 ZONA INDUSTRIAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('40 40 ZONA MILITAR');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('41 41 ZONA NAVAL');");
    await db.execute("INSERT INTO TiposAsentamiento (TipoAsentamiento) VALUES('42 42 NINGUNO');");

    //Tabla estados civiles
    await db.execute("CREATE TABLE tb_EstadosCiviles (EstadoCivil TEXT);");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('1 1 Soltero(a)');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('2 2 Casado(a)');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('3 3 Divorciado(a)');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('4 4 Viudo(a)');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('5 5 Unión libre');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('6 6 Madre Soltera');");
    await db.execute("INSERT INTO tb_EstadosCiviles (EstadoCivil) VALUES ('7 7 Padre Soltero');");

    //Tabla parentescos
    await db.execute("CREATE TABLE tb_Parentescos (Parentesco TEXT);");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('1 1 Cuñado(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('2 2 Hijo(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('3 3 Nieto(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('4 4 Hermano(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('5 5 Yerno');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('6 6 Titular');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('7 7 Tio(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('8 8 Primo(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('9 9 Bisnieto(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('10 10 Otro');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('11 11 Nuera');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('12 12 Cónyuge');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('13 13 Padre');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('14 14 Sobrino(a)');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('15 15 Madre');");
    await db.execute("INSERT INTO tb_Parentescos (Parentesco) VALUES ('16 16 Suegro(a)');");

    //Tabla de Escolaridades
    await db.execute("CREATE TABLE tb_Escolaridades (Escolaridad TEXT);");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('1 1 N/A');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('2 2 Analfabeto');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('3 3 Alfabeto');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('4 4 Preescolar');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('5 5 Primaria');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('6 6 Secundaria');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('7 7 Preparatoria');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('8 8 Carrera técnica con primaria completa');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('9 9 Carrera técnica con secundaria completa');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('10 10 Carrera técnica con preparatoria completa');");
    await db.execute("INSERT INTO tb_Escolaridades (Escolaridad) VALUES ('11 11 Licenciatura');");

    //Tabla Grados escolares
    await db.execute("CREATE TABLE tb_GradosEscolares (GradoEscolar TEXT);");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('1 0');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('2 1');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('3 2');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('4 3');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('5 4');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('6 5');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('7 6');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('8 7');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('9 8');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('10 9');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('11 10');");
    await db.execute("INSERT INTO tb_GradosEscolares (GradoEscolar) VALUES ('12 11');");

    //Tabla Derechohabiencia
    await db.execute("CREATE TABLE tb_Derechohabiencias (Derechohabiencia TEXT);");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('1 1 Seguro Popular');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('2 2 IMSS');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('3 3 ISSSTE');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('4 4 Pemex, Defensa o Marina');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('5 5 Clinica u Hospitalidad Privada');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('6 6 A ninguna');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('7 7 Otra');");
    await db.execute("INSERT INTO tb_Derechohabiencias (Derechohabiencia) VALUES ('8 8 N/A');");

    //Tabla MotivoDerechohabiencia
    await db.execute("CREATE TABLE tb_MotivoDerechohabiencias (MotivoDerechohabiencia TEXT);");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('1 1 N/A');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('2 2 Prestación en el trabajo');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('3 3 Jubilación');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('4 4 Invalidez');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('5 5 Algún familiar en el hogar');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('6 6 Muerte del asegurado');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('7 7 Ser estudiante');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('8 8 Contratación propia');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('9 9 Algún familiar de otro hogar');");
    await db.execute("INSERT INTO tb_MotivoDerechohabiencias (MotivoDerechohabiencia) VALUES ('10 10 OtroApoyo del gobierno');");

    //Tabla Ocupaciones
    await db.execute("CREATE TABLE tb_Ocupaciones (Ocupacion TEXT);");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('1 1 N/A');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('2 2 Albañil');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('3 3 Artesano');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('4 4 Ayudante de algún oficio');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('5 5 Ayudante en negocio familiar sin retribución');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('6 6 Ayudante en negocio no familiar sin retribución');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('7 7 Chofer');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('8 8 Ejidatario o Comunero');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('9 9 Empleado del gobierno');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('10 10 Empleado del sector privado');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('11 11 Empleado doméstico');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('12 12 Jornalero agrícola');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('13 13 Miembro de un grupo de productores');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('14 14 Miembro de una cooperativa');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('15 15 Obrero');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('16 16 Patrón de un negocio');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('17 17 Profesionista independiente');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('18 18 Promotor de desarrollo humano');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('19 19 Trabajador por cuenta propia');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('20 20 Vendedor ambulante');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('21 21 Otra ocupación');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('22 22 Desempleado');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('23 23 Pescador');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('24 24 Ama de Casa');");
    await db.execute("INSERT INTO tb_Ocupaciones (Ocupacion) VALUES ('25 25 Estudiante');");

    //Tabla TiposEmpleado
    await db.execute("CREATE TABLE tb_TipoEmpleos (TipoEmpleo TEXT);");
    await db.execute("INSERT INTO tb_TipoEmpleos (TipoEmpleo) VALUES ('1 1 N/A');");
    await db.execute("INSERT INTO tb_TipoEmpleos (TipoEmpleo) VALUES ('2 2 Asalariado');");
    await db.execute("INSERT INTO tb_TipoEmpleos (TipoEmpleo) VALUES ('3 3 Propio con sueldo asignado / independiente con pago');");
    await db.execute("INSERT INTO tb_TipoEmpleos (TipoEmpleo) VALUES ('4 4 Propio sin sueldo asignado / independiente sin pago');");

    //Tabla de Discpacidades
    await db.execute("CREATE TABLE tb_CapacidadesDiferentes (CapacidadDiferente TEXT);");
    await db.execute("INSERT INTO tb_CapacidadesDiferentes (CapacidadDiferente) VALUES ('1 0 N/A');");
    await db.execute("INSERT INTO tb_CapacidadesDiferentes (CapacidadDiferente) VALUES ('2 1 Sensoriales y de Comunicación');");
    await db.execute("INSERT INTO tb_CapacidadesDiferentes (CapacidadDiferente) VALUES ('3 2 Motrices');");
    await db.execute("INSERT INTO tb_CapacidadesDiferentes (CapacidadDiferente) VALUES ('4 3 Aprendizaje y comportamiento');");
    await db.execute("INSERT INTO tb_CapacidadesDiferentes (CapacidadDiferente) VALUES ('5 4 Más de 1 discapacidad');");

    //Tabla de Condiciones de salud
    await db.execute("CREATE TABLE tb_CondicionesSalud (CondicionesSalud TEXT);");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('1 0 N/A');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('2 1 Infecciosas (Hepatitis, ETS, Virus)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('3 2 Tumores (malignos y no malignos)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('4 3 De la sangre (anemias)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('5 4 Diabetes, tiroides, obesidad');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('6 5 Desórdenes mentales (esquizofrenia)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('7 6 Sistema nervioso (neuropatías)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('8 7 Enfermedades de los sentidos');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('9 8 Sistema circulatorio (hipertensión)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('10 9 Sistema respiratorio (neumonía)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('11 10 Aparato digestivo (Colitis, hernias)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('12 11 De la piel (Dermatitis)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('13 12 Genitourinario (insuficiencia renal)');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('14 13 Malformaciones');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('15 14 Sintomas no clasificados');");
    await db.execute("INSERT INTO tb_CondicionesSalud (CondicionesSalud) VALUES ('16 15 Lesiones, heridas, intoxicaciones');");

    //Tabla de Adicciones
    await db.execute("CREATE TABLE tb_Adicciones (Adiccion TEXT);");
    await db.execute("INSERT INTO tb_Adicciones (Adiccion) VALUES ('1 0 N/A');");
    await db.execute("INSERT INTO tb_Adicciones (Adiccion) VALUES ('2 1 Tabaquismo');");
    await db.execute("INSERT INTO tb_Adicciones (Adiccion) VALUES ('3 2 Alcoholismo');");
    await db.execute("INSERT INTO tb_Adicciones (Adiccion) VALUES ('4 3 Drogadicción');");
    await db.execute("INSERT INTO tb_Adicciones (Adiccion) VALUES ('5 4 Otra');");

    //Tabla de Pueblo Indigena
    await db.execute("CREATE TABLE tb_EtniasIndigenas (EtniaIndigena TEXT);");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('1 0 N/A');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('2 1 Aketeko');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('3 2 Amuzgo');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('4 3 Awaketeko');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('5 4 Apayapaneco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('6 5 Cora');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('7 6 Cucapá');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('8 7 Cuicateco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('9 8 Chatino');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('10 9 Chichimeco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('11 10 Chinanteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('12 11 Chochotelco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('13 12 Chontal Oaxaca');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('14 13 Chontal Tabasco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('15 14 Chuj');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('16 15 Ch''ol');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('17 16 Guarijìo');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('18 17 Huasteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('19 18 Huave');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('20 19 Huichol');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('21 20 Ixcateco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('22 21 Ixil');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('23 22 Jakalteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('24 23 Kaqchikel');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('25 24 Kickapoo');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('26 25 Killiwa');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('27 26 Kumial');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('28 27 Ku''ahl');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('29 28 k''iche''');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('30 29 Lacandón');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('31 30 Mam');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('32 31 Matlatzinaca');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('33 32 Maya');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('34 33 Mayo');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('35 34 Mazahua');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('36 35 Mazateco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('37 36 Mixe');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('38 37 Mixteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('39 38 Náhuatl');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('40 39 Oluteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('41 40 Otomí');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('42 41 Paipal');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('43 42 Pame');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('44 43 Pápago');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('45 44 Pima');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('46 45 Popoloca');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('47 46 Popoluca');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('48 47 Qato''k');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('49 48 Qánjobál');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('50 49 Qéchi''');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('51 50 Sayulteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('52 51 Seri');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('53 52 Tarahumara');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('54 53 Tarasco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('55 54 Teko');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('56 55 Tepehua');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('57 56 Tepehuano Norte');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('58 57 Tepehuano Sur');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('59 58 Texistepequeño');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('60 59 Tojolabal');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('61 60 Totonaco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('62 61 Triqui');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('63 62 Tlahuica');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('64 63 Tlapaneco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('65 64 Tseltal');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('66 65 Tsotsil');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('67 66 Yaqui');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('68 67 Zapoteco');");
    await db.execute("INSERT INTO tb_EtniasIndigenas (EtniaIndigena) VALUES ('69 68 Zoque');");

    //Tabla de tipo de vivienda
    await db.execute("CREATE TABLE tb_TipoVivienda (TipoVivienda TEXT);");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('1 1 Unifamiliar');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('2 2 Dúplex');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('3 3 Compartida');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('4 4 Otra');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('5 5 Independiente');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('6 6 U. habitacional');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('7 7 Vecindad');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('8 8 Anexo a casa	');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('9 9 Vivienda móvil');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('10 10 Refugio');");
    await db.execute("INSERT INTO tb_TipoVivienda (TipoVivienda) VALUES ('11 11 N/A');");

    //Tabla de tipo de piso
    await db.execute("CREATE TABLE tb_TipoPisos (TipoPiso TEXT);");
    await db.execute("INSERT INTO tb_TipoPisos (TipoPiso) VALUES ('1 1 Madera, duela');");
    await db.execute("INSERT INTO tb_TipoPisos (TipoPiso) VALUES ('2 2 Mosaico, vinil');");
    await db.execute("INSERT INTO tb_TipoPisos (TipoPiso) VALUES ('3 3 Cemento o firme');");
    await db.execute("INSERT INTO tb_TipoPisos (TipoPiso) VALUES ('4 4 Tierra');");
    await db.execute("INSERT INTO tb_TipoPisos (TipoPiso) VALUES ('5 5 Otro');");

    //Tabla de tipo de tenencia
    await db.execute("CREATE TABLE tb_Tenencias (Tenencia TEXT);");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('1 1 Propia');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('2 2 Rentada');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('3 3 Pagándose');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('4 4 Prestada');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('5 5 Asentamiento irregular');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('6 6 Otro');");
    await db.execute("INSERT INTO tb_Tenencias (Tenencia) VALUES ('7 7 N/A');");

    //Tabla de tipo de techo
    await db.execute("CREATE TABLE tb_Techos (Techo TEXT);");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('1 1 Concreto, losa o viguetas');");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('2 2 Lámina de cartón');");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('3 3 Lámina asbesto, metálica');");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('4 4 Madera, teja');");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('5 5 Paja o palma');");
    await db.execute("INSERT INTO tb_Techos (Techo) VALUES ('6 6 Otros');");

    //Tabla de tipo de muro
    await db.execute("CREATE TABLE tb_TiposMuro (TipoMuro TEXT);");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('1 1 MADERA');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('2 2 ADOBE');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('3 3 LADRILLO, TABIQUE');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('4 4 LAMINA METALICA, ASBESTO');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('5 5 DESHECHOS, CARTON');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('6 6 CARRIZO, BAMBU');");
    await db.execute("INSERT INTO tb_TiposMuro (TipoMuro) VALUES ('7 7 OTROS');");

  }

  readData(table) async {
    var connection = await db;
    return await connection.query(table);
  }

  readFolio(table) async {
    var connection = await db;
    return await connection.query(table, where: "folio = (select max(folio) from datosGenerales)");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<int> saveDatosGenerales( DatosGeneralesModel datosGenerales)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Data, datosGenerales.toMap());
    return res;
  }

  Future<UserModel> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_NombreUsuario= '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }


  Future<int> saveBanio(Banio banio) async{
    var dbClient = await db;
    var res = await dbClient.insert(Table_Servicios, banio.toMap());
    return res;
  }

  Future<int> saveBano(Banio banio) async{
    var dbClient = await db;
    var res = await dbClient.insert(Table_Servicios, banio.toMap());
    return res;
  }

  Future<int> upDateLuz(Luz luz) async{
    var dbClient = await db;
    var res = await dbClient.update(Table_Servicios, luz.toMap(),where: "folio = ${luz.folio}");
    return res;
  }

  Future<int> upDateAgua(Agua agua) async{
    var dbClient = await db;
    var res = await dbClient.update(Table_Servicios, agua.toMap(),where: "folio = ${agua.folio}");
    return res;
  }

  Future<int> upDateGas(Gas gas) async{
    var dbClient = await db;
    var res = await dbClient.update(Table_Servicios, gas.toMap(),where: "folio = ${gas.folio}");
    return res;
  }

  Future<int> upDateDrenaje(Drenaje drenaje) async{
    var dbClient = await db;
    var res = await dbClient.update(Table_Servicios, drenaje.toMap(),where: "folio = ${drenaje.folio}");
    return res;
  }

  Future<int> saveEstructuraFamiliar(EstructuraFamilarModel estructuraFamilar)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_DatosFamiliares, estructuraFamilar.toMap());
    return res;
  }

  Future<int> saveEscolaridadSocial(EscolaridadSeguridadSocial escolaridadSeguridadSocial)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Escolaridad, escolaridadSeguridadSocial.toMap());
    return res;
  }

  Future<int> saveSaludIndigena(SaludPerteneciaIndigenaModel saludPerteneciaIndigenaModel)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Salud, saludPerteneciaIndigenaModel.toMap());
    return res;
  }

  Future<int> saveVivienda(EstadoCasaConstruccionModel estadoCasaConstruccionModel)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Vivienda, estadoCasaConstruccionModel.toMap());
    return res;
  }

  Future<int> saveCasa(CaracteristicasCasa caracteristicasCasa)async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Casa, caracteristicasCasa.toMap());
    return res;
  }



}