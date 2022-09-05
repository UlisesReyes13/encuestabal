import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/Gas.dart';
import 'package:encuestabal/Screens/EstructuraFamiliar.dart';
import 'package:encuestabal/Screens/ServiciosDrenaje.dart';
import 'package:flutter/material.dart';

enum ServCombustible {gasTanque, gasNatural, parrillaElectrica,
  leniaChimenea, leniaSinChimenea, otroCombustible, ninguno}

class ServiciosCombustible extends StatefulWidget {

  String folio;

  ServiciosCombustible(this.folio);

  @override
  State<ServiciosCombustible> createState() => _ServiciosCombustibleState();
}


class _ServiciosCombustibleState extends State<ServiciosCombustible> {
  ServCombustible _combustible = ServCombustible.gasTanque;

  enviar() async {
    String combustible = _combustible.name.toString();
    if(combustible == 'gasTanque'){
      combustible = '1 1 Gas tanque';
    }else if(combustible == 'gasNatural'){
      combustible = '2  2 Gas Natural';
    }else if(combustible == 'parrillaElectrica'){
      combustible = '3 3 Parrilla Electrica';
    }else if(combustible == 'leniaChimenea'){
      combustible = '4 4 Leña o Carbón con Chimenea';
    }else if(combustible == 'leniaSinChimenea'){
      combustible = '5 5 Leña o Carbón sin Chimenea';
    }else if(combustible == 'otroCombustible') {
      combustible = '6 6 Otro Combustible';
    }else if(combustible == 'ninguno'){
      combustible = '7 7 Ninguno';
    }

    var nomCombus = combustible; // 'artlang'
    final NombreCombustible = nomCombus
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

    var conbustiblePk = combustible; // 'artlang'
    final pkConbustible = conbustiblePk
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

    Gas BModel = Gas(folio: widget.folio,claveServGas: int.parse(pkConbustible.substring(0,2).trimRight()),ordenServGas: pkConbustible.substring(0,2).trimRight(),servGas:NombreCombustible.trimLeft() );
    await DbHelper().upDateGas(BModel).then((gas) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new EstructuraFamiliar(widget.folio);
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
                MaterialPageRoute(builder: (_) => ServiciosDrenaje(widget.folio)),
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
                getTextQuestion(question: 'Folio'),
                SizedBox(height: 5.0),
                getTextFolio(controller: TextEditingController.fromValue(
                    TextEditingValue(text: widget.folio))
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Combustible'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Gas en Tanque'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.gasTanque,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Gas Natural'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.gasNatural,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Parrilla Eléctrica'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.parrillaElectrica,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Leña o Carbón con Chimenea'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.leniaChimenea,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Leña o Carbón sin Chimenea'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.leniaSinChimenea,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro Combustible'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.otroCombustible,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ninguno'),
                  leading: Radio<ServCombustible>(
                    value: ServCombustible.ninguno,
                    groupValue: _combustible,
                    onChanged: (ServCombustible value){
                      setState(() {
                        _combustible = value;
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
