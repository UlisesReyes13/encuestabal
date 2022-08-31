import 'dart:developer';

import 'package:encuestabal/Model/NombreAsentamiento.dart';
import 'package:encuestabal/Model/UserModel.dart';
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

  }



  readData(table) async {
    var connection = await db;
    return await connection.query(table);
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


}