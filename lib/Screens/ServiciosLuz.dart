import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/ServiciosAgua.dart';
import 'package:encuestabal/Screens/ServiciosBanios.dart';
import 'package:flutter/material.dart';

enum ServLuz {servicioPublico, sinContrato, plantaParticular, panelSolar,
otro, sinServicio, noTiene, conContrato}
class ServiciosLuz extends StatefulWidget {

  @override
  State<ServiciosLuz> createState() => _ServiciosLuzState();
}

class _ServiciosLuzState extends State<ServiciosLuz> {

  ServLuz _luz = ServLuz.servicioPublico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context ,
                MaterialPageRoute(builder: (_) => ServiciosBanios()),
                    (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Luz'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Servicio Publico'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.servicioPublico,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Sin Contrato'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.sinContrato,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Planta Particular'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.plantaParticular,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Panel Solar'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.panelSolar,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.otro,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Sin Servicio'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.sinServicio,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No tiene'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.noTiene,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Con Contrato'),
                  leading: Radio<ServLuz>(
                    value: ServLuz.conContrato,
                    groupValue: _luz,
                    onChanged: (ServLuz value){
                      setState((){
                        _luz = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => ServiciosAgua()),
                              (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.white),
                    label: Text('Continuar', style: TextStyle(color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
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
