import 'package:encuestabal/Comm/genTextEquipamiento.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/Documentos.dart';
import 'package:encuestabal/Screens/Resolucion.dart';
import 'package:flutter/material.dart';

enum uno {si , no}
enum dos {si , no}
enum tres {si , no}
enum cuatro {si , no}
enum cinco {si , no}
enum seis {si , no}
enum siete {si , no}
enum ocho {si , no}
enum nueve {si , no}
enum diez {si , no}
enum once {si , no}
enum doce {si , no}

class Alimentacion extends StatefulWidget {

  String folio;

  Alimentacion(this.folio);

  @override
  State<Alimentacion> createState() => _AlimentacionState();
}

class _AlimentacionState extends State<Alimentacion> {

  uno _uno = uno.si;
  dos _dos = dos.si;
  tres _tres = tres.si;
  cuatro _cuatro = cuatro.si;
  cinco _cinco = cinco.si;
  seis _seis = seis.si;
  siete _siete;
  ocho _ocho;
  nueve _nueve;
  diez _diez;
  once _once;
  doce _doce;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alimentación'),
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Documentos(widget.folio)),
                    (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Folio'),
                SizedBox(height: 5.0),
                getTextFolio(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.folio)),
                ),

                SizedBox(height: 10.0),
                getTextEquipamiento(encabezado: 'EN LOS ULTIMOS 3 MESES, POR FALTA DE DINERO U OTROS RECURSOS...'),
                SizedBox(height: 10.0),
                getTextQuestion(question: '1. ¿Alguna vez usted  o algún adulto en su hogar tuvo una alimentación basada en poca variedad de alimentos?'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<uno>(
                          value: uno.si,
                          groupValue: _uno,
                          onChanged: (uno value) {
                            setState(() {
                              _uno = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<uno>(
                          value: uno.no,
                          groupValue: _uno,
                          onChanged: (uno value) {
                            setState(() {
                              _uno = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '2. ¿Alguna vez usted  o algún adulto en su hogar dejó de desayunar, comer o cenar?'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<dos>(
                          value: dos.si,
                          groupValue: _dos,
                          onChanged: (dos value) {
                            setState(() {
                              _dos = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<dos>(
                          value: dos.no,
                          groupValue: _dos,
                          onChanged: (dos value) {
                            setState(() {
                              _dos = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '3. ¿Alguna vez usted  o algún adulto en su hogar comió menos de lo que piensa debia comer?'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<tres>(
                          value: tres.si,
                          groupValue: _tres,
                          onChanged: (tres value) {
                            setState(() {
                              _tres = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<tres>(
                          value: tres.no,
                          groupValue: _tres,
                          onChanged: (tres value) {
                            setState(() {
                              _tres = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: '4. ¿Alguna vez se quedaron sin comida?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<cuatro>(
                          value: cuatro.si,
                          groupValue: _cuatro,
                          onChanged: (cuatro value) {
                            setState(() {
                              _cuatro = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<cuatro>(
                          value: cuatro.no,
                          groupValue: _cuatro,
                          onChanged: (cuatro value) {
                            setState(() {
                              _cuatro = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '5. ¿Alguna vez ustede o algún adulto de su hogar sintió hambre, pero no comió?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<cinco>(
                          value: cinco.si,
                          groupValue: _cinco,
                          onChanged: (cinco value) {
                            setState(() {
                              _cinco = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<cinco>(
                          value: cinco.no,
                          groupValue: _cinco,
                          onChanged: (cinco value) {
                            setState(() {
                              _cinco = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '6. ¿Alguna vez ustede o algún adulto de su hogar sólo comió una vez al día o dejo de come durante el día?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<seis>(
                          value: seis.si,
                          groupValue: _seis,
                          onChanged: (seis value) {
                            setState(() {
                              _seis = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<seis>(
                          value: seis.no,
                          groupValue: _seis,
                          onChanged: (seis value) {
                            setState(() {
                              _seis = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 10.0),
                getTextEquipamiento(encabezado: 'SI EN EL HOGAR NO HAY PERSONAS MENORES DE 18 AÑOS PASE A LA SECCIÓN 8. RESULTADOS'),
                SizedBox(height: 10.0),
                getTextQuestion(question: '7. ¿Alguna vez algún menor de 18 años en su hogar tuvo una alimentación basada en poca variedad de alimentos?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<siete>(
                          value: siete.si,
                          groupValue: _siete,
                          onChanged: (siete value) {
                            setState(() {
                              _siete = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<siete>(
                          value: siete.no,
                          groupValue: _siete,
                          onChanged: (siete value) {
                            setState(() {
                              _siete = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '8. ¿Alguna vez algún menor de 18 años en su hogar comió menos de lo que debia?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<ocho>(
                          value: ocho.si,
                          groupValue: _ocho,
                          onChanged: (ocho value) {
                            setState(() {
                              _ocho = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<ocho>(
                          value: ocho.no,
                          groupValue: _ocho,
                          onChanged: (ocho value) {
                            setState(() {
                              _ocho = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '9. ¿Alguna vez en su hogar tuvieron tuvieron que disminuir la cantidad servida en la comida a algún menor de 18 años?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<nueve>(
                          value: nueve.si,
                          groupValue: _nueve,
                          onChanged: (nueve value) {
                            setState(() {
                              _nueve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<nueve>(
                          value: nueve.no,
                          groupValue: _nueve,
                          onChanged: (nueve value) {
                            setState(() {
                              _nueve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '10. ¿Alguna vez algún menor de 18 años en su hogar sintió hambre, pero no comió?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<diez>(
                          value: diez.si,
                          groupValue: _diez,
                          onChanged: (diez value) {
                            setState(() {
                              _diez = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<diez>(
                          value: diez.no,
                          groupValue: _diez,
                          onChanged: (diez value) {
                            setState(() {
                              _diez = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '11. ¿Alguna vez algún menor de 18 años se durmio con hambre?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<once>(
                          value: once.si,
                          groupValue: _once,
                          onChanged: (once value) {
                            setState(() {
                              _once = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<once>(
                          value: once.no,
                          groupValue: _once,
                          onChanged: (once value) {
                            setState(() {
                              _once = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: '12. ¿Alguna vez algún menor de 18 años comió una vez al día o dejó de comer durante todo un día?'),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<doce>(
                          value: doce.si,
                          groupValue: _doce,
                          onChanged: (doce value) {
                            setState(() {
                              _doce = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<doce>(
                          value: doce.no,
                          groupValue: _doce,
                          onChanged: (doce value) {
                            setState(() {
                              _doce = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new Resolucion(widget.folio);
                      }));
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
