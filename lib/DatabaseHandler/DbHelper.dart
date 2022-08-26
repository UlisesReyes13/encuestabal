import 'package:encuestabal/Model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
  static Database _db;

  static const String DB_Name = 'encuestas.db';
  static const String Table_User = 'usuario';
  static const int Version = 1;


  static const String C_idUsuario = 'idUsuario';
  static const String C_NombreUsuario = 'nombreUsuario';
  static const String C_Nombre = 'nombre';
  static const String C_ApellidoP = 'apellidoP';
  static const String C_ApellidoM = 'apellidoM';
  static const String C_Rol = 'rol';
  static const String C_Password = 'password';

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
    await db.execute("CREATE TABLE $Table_User ("
        " $C_idUsuario INTEGER not null Primary key AUTOINCREMENT ,"
        " $C_NombreUsuario TEXT, "
        " $C_Nombre TEXT, "
        " $C_ApellidoP TEXT,"
        " $C_ApellidoM TEXT,"
        " $C_Rol TEXT,"
        " $C_Password TEXT"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
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