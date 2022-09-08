import 'package:encuestabal/Comm/genTextEquipamiento.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/Screens/Caracteristicas_Casa.dart';
import 'package:flutter/material.dart';

enum Refrigerador { si, no }

enum RefrigeradorSirve { si, no }

enum Estufa { si, no }

enum EstufaSirve { si, no }

enum Video { si, no }

enum VideoSirve { si, no }

enum Lavadora { si, no }

enum LavadoraSirve { si, no }

enum Licuadora { si, no }

enum LicuadoraSirve { si, no }

enum Television { si, no }

enum TelevisonSirve { si, no }

enum RadioE { si, no }

enum RadioSirve { si, no }

enum Sala { si, no }

enum SalaSirve { si, no }

enum Comedor { si, no }

enum ComedorSirve { si, no }

enum Automovil { si, no }

enum AutomovilSirve { si, no }

enum Cama { si, no }

enum CamaSirve { si, no }

enum Celular { si, no }

enum CelularSirve { si, no }

enum Motocicleta { si, no }

enum MotocicletaSirve { si, no }

enum Computadora { si, no }

enum ComputadoraSirve { si, no }

enum Horno { si, no }

enum HornoSirve { si, no }

enum Telefono { si, no }

enum TelefonoSirve { si, no }

class Equipamineto extends StatefulWidget {
  String folio;
  Equipamineto(this.folio);

  @override
  State<Equipamineto> createState() => _EquipaminetoState();
}

class _EquipaminetoState extends State<Equipamineto> {
  Refrigerador _refrigerador = Refrigerador.si;
  RefrigeradorSirve _refrigeradorSirve = RefrigeradorSirve.si;
  Estufa _estufa = Estufa.si;
  EstufaSirve _estufaSirve = EstufaSirve.si;
  Video _video = Video.si;
  VideoSirve _videoSirve = VideoSirve.si;
  Lavadora _lavadora = Lavadora.si;
  LavadoraSirve _lavadoraSirve = LavadoraSirve.si;
  Licuadora _licuadora = Licuadora.si;
  LicuadoraSirve _licuadoraSirve = LicuadoraSirve.si;
  Television _television = Television.si;
  TelevisonSirve _televisonSirve = TelevisonSirve.si;
  RadioE _radio = RadioE.si;
  RadioSirve _radioSirve = RadioSirve.si;
  Sala _sala = Sala.si;
  SalaSirve _salaSirve = SalaSirve.si;
  Comedor _comedor = Comedor.si;
  ComedorSirve _comedorSirve = ComedorSirve.si;
  Automovil _automovil = Automovil.si;
  AutomovilSirve _automovilSirve = AutomovilSirve.si;
  Cama _cama = Cama.si;
  CamaSirve _camaSirve = CamaSirve.si;
  Celular _celular = Celular.si;
  CelularSirve _celularSirve = CelularSirve.si;
  Motocicleta _motocicleta = Motocicleta.si;
  MotocicletaSirve _motocicletaSirve = MotocicletaSirve.si;
  Computadora _computadora = Computadora.si;
  ComputadoraSirve _computadoraSirve = ComputadoraSirve.si;
  Horno _horno = Horno.si;
  HornoSirve _hornoSirve = HornoSirve.si;
  Telefono _telefono = Telefono.si;
  TelefonoSirve _telefonoSirve = TelefonoSirve.si;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    var tiene = 100.0;
    var sirve = 200.0;
    var estufa = 115.0;
    var video = 5.0;
    var lavadora = 92.0;
    if (orientation == Orientation.landscape) {
      tiene = 150.0;
      sirve = 450.0;
      estufa = 115.00;
      video = 4.0;
      lavadora = 89.0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamiento'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Caracteristicas_Casa(widget.folio)),
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
                Container(
                  child: Row(
                    children: [
                      SizedBox(height: 50.0),
                      getTextEquipamiento(encabezado: 'Equipamiento'),
                      SizedBox(width: tiene),
                      getTextEquipamiento(encabezado: 'Tiene'),
                      SizedBox(width: sirve),
                      getTextEquipamiento(encabezado: 'Sirve'),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Refrigerador'),
                    SizedBox(width: 60.0),

                    //REFRIGERADOR
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Refrigerador>(
                          value: Refrigerador.si,
                          groupValue: _refrigerador,
                          onChanged: (Refrigerador value) {
                            setState(() {
                              _refrigerador = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Refrigerador>(
                          value: Refrigerador.no,
                          groupValue: _refrigerador,
                          onChanged: (Refrigerador value) {
                            setState(() {
                              _refrigerador = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<RefrigeradorSirve>(
                          value: RefrigeradorSirve.si,
                          groupValue: _refrigeradorSirve,
                          onChanged: (RefrigeradorSirve value) {
                            setState(() {
                              _refrigeradorSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<RefrigeradorSirve>(
                          value: RefrigeradorSirve.no,
                          groupValue: _refrigeradorSirve,
                          onChanged: (RefrigeradorSirve value) {
                            setState(() {
                              _refrigeradorSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Estufa'),
                    SizedBox(width: estufa),
                    //ESTUFA
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Estufa>(
                          value: Estufa.si,
                          groupValue: _estufa,
                          onChanged: (Estufa value) {
                            setState(() {
                              _estufa = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Estufa>(
                          value: Estufa.no,
                          groupValue: _estufa,
                          onChanged: (Estufa value) {
                            setState(() {
                              _estufa = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<EstufaSirve>(
                          value: EstufaSirve.si,
                          groupValue: _estufaSirve,
                          onChanged: (EstufaSirve value) {
                            setState(() {
                              _estufaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<EstufaSirve>(
                          value: EstufaSirve.no,
                          groupValue: _estufaSirve,
                          onChanged: (EstufaSirve value) {
                            setState(() {
                              _estufaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Video, DVD, Blu-ray'),
                    SizedBox(width: video),
                    //Video
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Video>(
                          value: Video.si,
                          groupValue: _video,
                          onChanged: (Video value) {
                            setState(() {
                              _video = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Video>(
                          value: Video.no,
                          groupValue: _video,
                          onChanged: (Video value) {
                            setState(() {
                              _video = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<VideoSirve>(
                          value: VideoSirve.si,
                          groupValue: _videoSirve,
                          onChanged: (VideoSirve value) {
                            setState(() {
                              _videoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<VideoSirve>(
                          value: VideoSirve.no,
                          groupValue: _videoSirve,
                          onChanged: (VideoSirve value) {
                            setState(() {
                              _videoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Lavadora'),
                    SizedBox(width: lavadora),
                    //Lavadora
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Lavadora>(
                          value: Lavadora.si,
                          groupValue: _lavadora,
                          onChanged: (Lavadora value) {
                            setState(() {
                              _lavadora = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Lavadora>(
                          value: Lavadora.no,
                          groupValue: _lavadora,
                          onChanged: (Lavadora value) {
                            setState(() {
                              _lavadora = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<LavadoraSirve>(
                          value: LavadoraSirve.si,
                          groupValue: _lavadoraSirve,
                          onChanged: (LavadoraSirve value) {
                            setState(() {
                              _lavadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<LavadoraSirve>(
                          value: LavadoraSirve.no,
                          groupValue: _lavadoraSirve,
                          onChanged: (LavadoraSirve value) {
                            setState(() {
                              _lavadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Licuadora'),
                    SizedBox(width: lavadora),
                    //Licuadora
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Licuadora>(
                          value: Licuadora.si,
                          groupValue: _licuadora,
                          onChanged: (Licuadora value) {
                            setState(() {
                              _licuadora = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Licuadora>(
                          value: Licuadora.no,
                          groupValue: _licuadora,
                          onChanged: (Licuadora value) {
                            setState(() {
                              _licuadora = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<LicuadoraSirve>(
                          value: LicuadoraSirve.si,
                          groupValue: _licuadoraSirve,
                          onChanged: (LicuadoraSirve value) {
                            setState(() {
                              _licuadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<LavadoraSirve>(
                          value: LavadoraSirve.no,
                          groupValue: _lavadoraSirve,
                          onChanged: (LavadoraSirve value) {
                            setState(() {
                              _lavadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
