import 'package:encuestabal/Screens/DatosGenerales.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genLoginSignupHeader.dart';
import 'package:encuestabal/Comm/genTextFormField.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/UserModel.dart';
import 'package:encuestabal/Screens/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Por favor introduzca su usuario");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Por favor introduzca la contraseña");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => DatosGenerales()),
                    (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: Usuario no registrado");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Fallo del login");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setInt("idUsuario", user.idUsuario);
    sp.setString("nombreUsuario", user.nombreUsuario);
    sp.setString("nombre", user.nombre);
    sp.setString("apellidoP", user.apellidoP);
    sp.setString("apellidoM", user.apellidoM);
    sp.setString("rol", user.rol);
    sp.setString("Password", user.Password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESN'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Login'),
                getTextFormField(
                    controller: _conUserId,
                    icon: Icons.person,
                    hintName: 'Nombre de Usuario'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Contraseña',
                  isObscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No tienes cuenta? '),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text('Registrar'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupForm()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}