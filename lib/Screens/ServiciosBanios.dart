import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/DatosGenerales.dart';
import 'package:encuestabal/Screens/ServiciosLuz.dart';
import 'package:flutter/material.dart';

enum ServBanio {sanitario,anitario, aguaConCubeta, letrinaSeca, pozo_hoyo, noTiene,razSuelo,otro}

class ServiciosBanios extends StatefulWidget {

  String folio;
  ServiciosBanios(this.folio);

  @override
  State<ServiciosBanios> createState() => _ServiciosBaniosState();
}


class _ServiciosBaniosState extends State<ServiciosBanios> {

  ServBanio _banio = ServBanio.sanitario;

  enviar(){
    String banio = _banio.name.toString();
    if(banio == 'sanitario'){
      banio = '1 1 Descarga Directa';
    }else if(banio == 'anitario'){
      banio = '2 2 Sin Descarga Directa';
    }else if(banio == 'aguaConCubeta'){
      banio = '8 8 Agua Con Cubeta';
    }else if(banio == 'letrinaSeca'){
      banio = '3 3 Letrina Seca';
    }else if(banio == 'pozo_hoyo') {
      banio = '4 4 Pozo u Hoyo';
    } else if(banio == 'noTiene'){
      banio = '7 7 No tiene';
    }else if (banio == 'rasSuelo') {
      banio = '5 5 Ras de Suelo';
    } else if(banio == 'otro'){
      banio = '6 6 Otro';
    }
    print(banio);
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
                MaterialPageRoute(builder: (_) => DatosGenerales()),
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
                getTextQuestion(question: 'Baño o Excusado'),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Sanitario / Baño Con Descarga Directa'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.sanitario,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Aniario / Baño Sin Descarga Directa'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.anitario,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Letrina Seca'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.letrinaSeca,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Pozo u Hoyo'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.pozo_hoyo,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Ras Del Suelo'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.razSuelo,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Otro'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.otro,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No Tiene'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.noTiene,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Agua Con Cubeta'),
                  leading: Radio<ServBanio>(
                    value: ServBanio.aguaConCubeta,
                    groupValue: _banio,
                    onChanged: (ServBanio value){
                      setState(() {
                        _banio = value;
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
                        return new ServiciosLuz(widget.folio);
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

