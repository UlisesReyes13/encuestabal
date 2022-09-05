import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/Agua.dart';
import 'package:encuestabal/Screens/ServiciosLuz.dart';
import 'package:flutter/material.dart';
import 'package:encuestabal/Screens/ServiciosDrenaje.dart';

enum ServAgua {tomaDomiciliaria, tomaComun, pipa, pozo_rio_lago, llavePublica,
acarreoVivienda, otraFuente, ninguna, noTiene, otro}

class ServiciosAgua extends StatefulWidget {

  String folio;
  ServiciosAgua(this.folio);

  @override
  State<ServiciosAgua> createState() => _ServiciosAguaState();
}

class _ServiciosAguaState extends State<ServiciosAgua> {

  ServAgua _agua= ServAgua.tomaDomiciliaria;

  enviar() async {
    String agua = _agua.name.toString();
    if(agua == 'tomaDomiciliaria'){
      agua = '1 1 Toma Domiciliaria';
    }else if(agua == 'tomaComun'){
      agua  = '2 2 Toma Común o Fuera de Vivienda';
    }else if(agua == 'pipa'){
      agua = '3 3 Pipa';
    }else if(agua == 'pozo_rio_lago'){
      agua = '4 4 Pozo, Río, Lago';
    }else if(agua == 'llavePublica'){
      agua = '5 5 Llave Publica';
    }else if(agua == 'acarreoVivienda'){
      agua = '6 6 Acarrean de otra vivienda';
    }else if(agua == 'otraFuente'){
      agua = '7 7 Otra Fuente';
    }else if(agua == 'ninguna'){
      agua = '8 8 Ninguna';
    }else if(agua == 'noTiene'){
      agua = '9 9 No tiene';
    }else if(agua == 'otro'){
      agua = '10 10 Otro';
    }

    var nomAgua = agua; // 'artlang'
    final tipoAgua = nomAgua
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

    var aguapk = agua; // 'artlang'
    final pkAgua = aguapk
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

    Agua BModel = Agua(folio: widget.folio,claveServAgua: int.parse(pkAgua.substring(0,2).trimRight()),ordenServAgua: pkAgua.substring(0,2).trimRight(),servAgua: tipoAgua.trimLeft());
    await DbHelper().upDateAgua(BModel).then((agua) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new ServiciosDrenaje(widget.folio);
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
                MaterialPageRoute(builder: (_) => ServiciosLuz(widget.folio)),
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
                getTextQuestion(question: 'AGUA'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Toma Domiciliaria'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.tomaDomiciliaria,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Toma Común o Fuera De Vivivienda'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.tomaComun,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Pipa'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.pipa,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Pozo, Río, Lago'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.pozo_rio_lago,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Llave Publica'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.llavePublica,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Acarrean de Otra Vivienda'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.acarreoVivienda,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otra Fuente'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.otraFuente,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ninguna'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.ninguna,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No Tiene'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.noTiene,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServAgua>(
                    value: ServAgua.otro,
                    groupValue: _agua,
                    onChanged: (ServAgua value){
                      setState(() {
                        _agua = value;
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
