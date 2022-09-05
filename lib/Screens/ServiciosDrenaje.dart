import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/Drenaje.dart';
import 'package:encuestabal/Screens/ServiciosAgua.dart';
import 'package:encuestabal/Screens/ServiciosCombustible.dart';
import 'package:flutter/material.dart';

enum ServDrenaje {redPublica, fosaSeptica, tuberiaGrieta, otro, sinServicio,
noTiene, tuberiaRio, rasSuelo, letrina, drenaje}

class ServiciosDrenaje extends StatefulWidget {

  String folio;
  ServiciosDrenaje(this.folio);

  @override
  State<ServiciosDrenaje> createState() => _ServiciosDrenajeState();
}

class _ServiciosDrenajeState extends State<ServiciosDrenaje> {
  ServDrenaje _drenaje = ServDrenaje.redPublica;

  enviar() async {
    String drenaje = _drenaje.name.toString();
    if(drenaje == 'redPublica'){
      drenaje = '1 1 Red Pública';
    }else if(drenaje == 'fosaSeptica'){
      drenaje = '2 2 Fosa Séptica';
    }else if(drenaje == 'tuberiaGrieta'){
      drenaje = '3 3 Tubería que va a dar a una grieta';
    }else if(drenaje == 'otro'){
      drenaje = '4 4 Otro';
    }else if(drenaje == 'sinServicio'){
      drenaje = '5 5 Sin Servicio';
    }else if(drenaje == 'noTiene'){
      drenaje = '6 6 No tiene';
    }else if(drenaje == 'tuberiaRio'){
      drenaje = '7 7 Tubería que va a dar a un río';
    }else if(drenaje == 'rasSuelo'){
      drenaje = '8 8 Ras de Suelo';
    }else if(drenaje == 'letrina'){
      drenaje = '9 9 Letrina';
    }else if(drenaje == 'drenaje'){
      drenaje = '10 10 Drenaje';
    }

    var nomDrenaje = drenaje; // 'artlang'
    final NombreDrenaje = nomDrenaje
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

    var drenajePk = drenaje; // 'artlang'
    final pkDrenaje = drenajePk
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

    Drenaje BModel = Drenaje(folio: widget.folio,claveServSanitario: int.parse(pkDrenaje.substring(0,2).trimRight()),ordenServSanitario: pkDrenaje.substring(0,2).trimRight(),servSanitario: NombreDrenaje.trimLeft());
    await DbHelper().upDateDrenaje(BModel).then((drenaje) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new ServiciosCombustible(widget.folio);
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
                context,
                MaterialPageRoute(builder: (_) => ServiciosAgua(widget.folio)),
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
                getTextQuestion(question: 'Drenaje'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Red Pública'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.redPublica,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Fosa Séptica'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.fosaSeptica,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Tubería que va a dar a una Grieta o Barranca'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.tuberiaGrieta,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.otro,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Sin Servicio'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.sinServicio,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No Tiene'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.noTiene,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Tubería que da a un Río, Lago o Mar'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.tuberiaRio,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ras de Suelo'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.rasSuelo,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Letrina'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.letrina,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Drenaje'),
                  leading: Radio<ServDrenaje>(
                    value: ServDrenaje.drenaje,
                    groupValue: _drenaje,
                    onChanged: (ServDrenaje value){
                      setState(() {
                        _drenaje = value;
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
