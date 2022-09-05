import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/Luz.dart';
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
  enviar() async {
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

    var nomLuz = luz; // 'artlang'
    final NombreLuz = nomLuz
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "")
        .replaceAll("0", "");

    var luzPk = luz; // 'artlang'
    final pkLuz = luzPk
        .replaceAll("A", "")
        .replaceAll("B", "")
        .replaceAll("C", "")
        .replaceAll("D", "")
        .replaceAll("E", "")
        .replaceAll("F", "")
        .replaceAll("G", "")
        .replaceAll("H", "")
        .replaceAll("I", "")
        .replaceAll("J", "")
        .replaceAll("K", "")
        .replaceAll("L", "")
        .replaceAll("M", "")
        .replaceAll("N", "")
        .replaceAll("Ñ", "")
        .replaceAll("O", "")
        .replaceAll("P", "")
        .replaceAll("Q", "")
        .replaceAll("R", "")
        .replaceAll("S", "")
        .replaceAll("T", "")
        .replaceAll("V", "")
        .replaceAll("W", "")
        .replaceAll("X", "")
        .replaceAll("Y", "")
        .replaceAll("Z", "")
        .replaceAll("a", "")
        .replaceAll("b", "")
        .replaceAll("c", "")
        .replaceAll("d", "")
        .replaceAll("e", "")
        .replaceAll("f", "")
        .replaceAll("g", "")
        .replaceAll("h", "")
        .replaceAll("i", "")
        .replaceAll("j", "")
        .replaceAll("k", "")
        .replaceAll("l", "")
        .replaceAll("m", "")
        .replaceAll("n", "")
        .replaceAll("ñ", "")
        .replaceAll("o", "")
        .replaceAll("p", "")
        .replaceAll("q", "")
        .replaceAll("r", "")
        .replaceAll("s", "")
        .replaceAll("t", "")
        .replaceAll("u", "")
        .replaceAll("v", "")
        .replaceAll("w", "")
        .replaceAll("x", "")
        .replaceAll("y", "")
        .replaceAll("Á", "")
        .replaceAll("É", "")
        .replaceAll("Í", "")
        .replaceAll("Ó", "")
        .replaceAll("Ú", "")
        .replaceAll("á", "")
        .replaceAll("é", "")
        .replaceAll("í", "")
        .replaceAll("ó", "")
        .replaceAll("ú", "")
        .replaceAll("z", "");

    Luz BModel = Luz(folio: widget.folio,claveServLuz: int.parse(pkLuz.substring(0,2).trimRight()) , ordenServLuz: pkLuz.substring(0,2).trimRight(),servLuz: NombreLuz.trimLeft());
    await DbHelper().upDateLuz(BModel).then((luz) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new ServiciosAgua(widget.folio);
      }
      ));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
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
                    onPressed: enviar,
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
