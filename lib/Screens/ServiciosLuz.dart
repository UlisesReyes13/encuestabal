import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/ServiciosAgua.dart';
import 'package:encuestabal/Screens/ServiciosBanios.dart';
import 'package:flutter/material.dart';

import '../Comm/genTextFolio.dart';

enum ServLuz {servicioPublico, sinContrato, plantaParticular, panelSolar,
otro, sinServicio, noTiene, conContrato}
class ServiciosLuz extends StatefulWidget {

  String folio;
  ServiciosLuz(this.folio);

  @override
  State<ServiciosLuz> createState() => _ServiciosLuzState();
}

class _ServiciosLuzState extends State<ServiciosLuz> {

  ServLuz _luz = ServLuz.servicioPublico;
  enviar(){
    String luz = _luz.name.toString();
    if (luz == 'servicioPublico') {
      luz = '1 1 Servicio Público';
    }else if(luz == 'sinContrato'){
      luz = '2 2 Sin Contrato';
    }else if(luz == 'plantaParticular'){
      luz = '3 3 Planta Particular';
    }else if(luz == 'panelSolar'){
      luz = '4 4 Panel Solar';
    }else if(luz == 'otro'){
      luz = ' 5 5 Otro';
    }else if(luz == 'sinServicio'){
      luz = '6 6 Sin Servicio';
    }else if(luz == 'noTiene'){
      luz = '7 7 No tiene';
    }else if(luz == 'conContrato'){
      luz = '8 8 Con Contrato';
    }
  }

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
                MaterialPageRoute(builder: (_) => ServiciosBanios(widget.folio)),
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
                SizedBox(height: 5.0),
                getTextFolio(controller: TextEditingController.fromValue(
                    TextEditingValue(text: widget.folio))
                ),
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
                      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new ServiciosAgua(widget.folio);
                        }
                      ));
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
