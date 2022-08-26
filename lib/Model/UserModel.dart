class UserModel {
  int idUsuario;
  String nombreUsuario;
  String nombre;
  String apellidoP;
  String apellidoM;
  String rol;
  String Password;


  UserModel(this.idUsuario, this.nombreUsuario, this.nombre, this.apellidoP,
      this.apellidoM, this.rol, this.Password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'idUsuario': idUsuario,
      'nombreUsuario': nombreUsuario,
      'nombre': nombre,
      'apellidoP': apellidoP,
      'apellidoM': apellidoM,
      'rol': rol,
      'Password': Password
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    idUsuario = map['idUsuario'];
    nombreUsuario = map['nombreUsuario'];
    nombre = map['nombre'];
    apellidoP = map['apellidoP'];
    apellidoM = map['apellidoM'];
    rol = map['rol'];
    Password = map['Password'];
  }
}