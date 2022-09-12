import 'package:encuestabal/Comm/comHelper.dart';
import 'package:encuestabal/Comm/genTextEquipamiento.dart';
import 'package:encuestabal/Comm/genTextFolio.dart';
import 'package:encuestabal/Comm/genTextQuestion.dart';
import 'package:encuestabal/DatabaseHandler/DbHelper.dart';
import 'package:encuestabal/Model/EquipamientoModel.dart';
import 'package:encuestabal/Screens/AportacionesEconomicas.dart';
import 'package:encuestabal/Screens/Caracteristicas_Casa.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

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

enum TelevisionSirve { si, no }

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
  TelevisionSirve _televisonSirve = TelevisionSirve.si;
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
  final _condiciones = TextEditingController();

  List<String> _Condiciones = ['Buena','Regular','Mala'];
  String selectedItem = 'Seleccionar';

  var dbHelper;

  @override
  void initState() {

    super.initState();
    dbHelper = DbHelper();
  }

  insertDatos() async {

    EquipamientoMovil DModel = EquipamientoMovil
      (folio: int.parse(widget.folio),
        pk_equipamientosRefri: "1",
        txt_desc_equipamientosRefri: "Refrigerador",
        tieneRefri: _refrigerador.name,
        sirveRefri: _refrigeradorSirve.name,
        pk_equipamientosEstufa: "2",
        txt_desc_equipamientosEstufa: "Estufa",
        tieneEstufa: _estufa.name,
        sirveEstufa: _estufaSirve.name,
        pk_equipamientosVideoDVDBlueRay: "3",
        txt_desc_equipamientosVideoDVDBlueRay: "VideoDVDBlueRay",
        tieneVideoDVDBlueRay: _video.name,
        sirveVideoDVDBlueRay: _videoSirve.name,
        pk_equipamientosLavadora: "4",
        txt_desc_equipamientosLavadora: "Lavadora",
        tieneLavadora: _lavadora.name,
        sirveLavadora: _lavadoraSirve.name,
        pk_equipamientosLicuadora: "5",
        txt_desc_equipamientosLicuadora: "Licuadora",
        tieneLicuadora: _licuadora.name,
        sirveLicuadora: _licuadoraSirve.name,
        pk_equipamientosTelevision: "6",
        txt_desc_equipamientosTelevision: "Television",
        tieneTelevision: _television.name,
        sirveTelevision: _televisonSirve.name,
        pk_equipamientosRadio: "7",
        txt_desc_equipamientosRadio: "Radio",
        tieneRadio: _radio.name,
        sirveRadio: _radioSirve.name,
        pk_equipamientosSala: "8",
        txt_desc_equipamientosSala: "Sala",
        tieneSala: _sala.name,
        sirveSala: _salaSirve.name,
        pk_equipamientosComedor: "9",
        txt_desc_equipamientosComedor: "Comedor",
        tieneComedor: _comedor.name,
        sirveComedor: _comedorSirve.name,
        pk_equipamientosAutoMovil: "10",
        txt_desc_equipamientosAutoMovil: "Automovil",
        tieneAutoMovil: _automovil.name,
        sirveAutoMovil: _automovilSirve.name,
        pk_equipamientosCama: "11",
        txt_desc_equipamientosCama: "Cama",
        tieneCama: _cama.name,
        sirveCama: _camaSirve.name,
        pk_equipamientosCelular: "12",
        txt_desc_equipamientosCelular: "Celular",
        tieneCelular: _celular.name,
        sirveCelular: _celularSirve.name,
        pk_equipamientosMotocicleta: "13",
        txt_desc_equipamientosMotocicleta:"Motocicleta" ,
        tieneMotocicleta: _motocicleta.name,
        sirveMotocicleta: _motocicletaSirve.name,
        pk_equipamientosComputadora: "14",
        txt_desc_equipamientosComputadora: "Computadora",
        tieneComputadora: _computadora.name,
        sirveComputadora: _computadoraSirve.name,
        pk_equipamientosHorno: "15",
        txt_desc_equipamientosHorno: "Horno",
        tieneHorno: _horno.name,
        sirveHorno: _hornoSirve.name,
        pk_equipamientosTelefono: "16",
        txt_desc_equipamientosTelefono: "Telefono",
        tieneTelefono: _telefono.name,
        sirveTelefono: _telefonoSirve.name,
        CondicionesGenerales: _condiciones.text.toString()
    );

    await dbHelper.saveEquipamiento(DModel).then((equipamientoMovil) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new AportacionesEconomicas(widget.folio);
      }
      ));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    var tiene = 100.0;
    var sirve = 200.0;
    var estufa = 115.0;
    var video = 5.0;
    var lavadora = 92.0;
    var licuadora = 86.0;
    var television = 87.0;
    var radio = 125.0;
    var sala = 137.0;
    var comedor = 100.0;
    var automovil = 94.0;
    var cama = 130.0;
    var celular = 120.0;
    var motocicleta = 80.0;
    var computadora = 67.0;
    var horno = 130.0;
    var telefono = 110.0;

    if (orientation == Orientation.landscape) {
      tiene = 150.0;
      sirve = 450.0;
      estufa = 115.00;
      video = 4.0;
      lavadora = 89.0;
      licuadora = 86.0;
      television = 87.0;
      radio = 125.0;
      sala = 137.0;
      comedor = 100.0;
      automovil = 94.0;
      cama = 130.0;
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
                  endIndent: 20,
                  color: Colors.black,
                ),
                //Refrigerador
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
                //Estufa
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
                //Video, DVD
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
                //Lavadora
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
                //Licuadora
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Licuadora'),
                    SizedBox(width: licuadora),
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
                //Television
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Televisión'),
                    SizedBox(width: television),
                    //Televisión
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Television>(
                          value: Television.si,
                          groupValue: _television,
                          onChanged: (Television value) {
                            setState(() {
                              _television = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Television>(
                          value: Television.no,
                          groupValue: _television,
                          onChanged: (Television value) {
                            setState(() {
                              _television = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<TelevisionSirve>(
                          value: TelevisionSirve.si,
                          groupValue: _televisonSirve,
                          onChanged: (TelevisionSirve value) {
                            setState(() {
                              _televisonSirve = value;
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
                //Radio
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Radio'),
                    SizedBox(width: radio),
                    //Radio
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<RadioE>(
                          value: RadioE.si,
                          groupValue: _radio,
                          onChanged: (RadioE value) {
                            setState(() {
                              _radio = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<RadioE>(
                          value: RadioE.no,
                          groupValue: _radio,
                          onChanged: (RadioE value) {
                            setState(() {
                              _radio = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<RadioSirve>(
                          value: RadioSirve.si,
                          groupValue: _radioSirve,
                          onChanged: (RadioSirve value) {
                            setState(() {
                              _radioSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<RadioSirve>(
                          value: RadioSirve.no,
                          groupValue: _radioSirve,
                          onChanged: (RadioSirve value) {
                            setState(() {
                              _radioSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Sala
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Sala'),
                    SizedBox(width: sala),
                    //Sala
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Sala>(
                          value: Sala.si,
                          groupValue: _sala,
                          onChanged: (Sala value) {
                            setState(() {
                              _sala = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Sala>(
                          value: Sala.no,
                          groupValue: _sala,
                          onChanged: (Sala value) {
                            setState(() {
                              _sala = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<SalaSirve>(
                          value: SalaSirve.si,
                          groupValue: _salaSirve,
                          onChanged: (SalaSirve value) {
                            setState(() {
                              _salaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<SalaSirve>(
                          value: SalaSirve.no,
                          groupValue: _salaSirve,
                          onChanged: (SalaSirve value) {
                            setState(() {
                              _salaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Comedor
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Comedor'),
                    SizedBox(width: comedor),
                    //Comedor
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Comedor>(
                          value: Comedor.si,
                          groupValue: _comedor,
                          onChanged: (Comedor value) {
                            setState(() {
                              _comedor = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Comedor>(
                          value: Comedor.no,
                          groupValue: _comedor,
                          onChanged: (Comedor value) {
                            setState(() {
                              _comedor = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<ComedorSirve>(
                          value: ComedorSirve.si,
                          groupValue: _comedorSirve,
                          onChanged: (ComedorSirve value) {
                            setState(() {
                              _comedorSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<ComedorSirve>(
                          value: ComedorSirve.no,
                          groupValue: _comedorSirve,
                          onChanged: (ComedorSirve value) {
                            setState(() {
                              _comedorSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Automovil
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Automóvil'),
                    SizedBox(width: automovil),
                    //Automóvil
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Automovil>(
                          value: Automovil.si,
                          groupValue: _automovil,
                          onChanged: (Automovil value) {
                            setState(() {
                              _automovil = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Automovil>(
                          value: Automovil.no,
                          groupValue: _automovil,
                          onChanged: (Automovil value) {
                            setState(() {
                              _automovil = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<AutomovilSirve>(
                          value: AutomovilSirve.si,
                          groupValue: _automovilSirve,
                          onChanged: (AutomovilSirve value) {
                            setState(() {
                              _automovilSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<AutomovilSirve>(
                          value: AutomovilSirve.no,
                          groupValue: _automovilSirve,
                          onChanged: (AutomovilSirve value) {
                            setState(() {
                              _automovilSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Cama
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Cama'),
                    SizedBox(width: cama),
                    //Cama
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Cama>(
                          value: Cama.si,
                          groupValue: _cama,
                          onChanged: (Cama value) {
                            setState(() {
                              _cama = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Cama>(
                          value: Cama.no,
                          groupValue: _cama,
                          onChanged: (Cama value) {
                            setState(() {
                              _cama = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<CamaSirve>(
                          value: CamaSirve.si,
                          groupValue: _camaSirve,
                          onChanged: (CamaSirve value) {
                            setState(() {
                              _camaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<CamaSirve>(
                          value: CamaSirve.no,
                          groupValue: _camaSirve,
                          onChanged: (CamaSirve value) {
                            setState(() {
                              _camaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Celular
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Celular'),
                    SizedBox(width: celular),
                    //Celular
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Celular>(
                          value: Celular.si,
                          groupValue: _celular,
                          onChanged: (Celular value) {
                            setState(() {
                              _celular = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Celular>(
                          value: Celular.no,
                          groupValue: _celular,
                          onChanged: (Celular value) {
                            setState(() {
                              _celular = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<CelularSirve>(
                          value: CelularSirve.si,
                          groupValue: _celularSirve,
                          onChanged: (CelularSirve value) {
                            setState(() {
                              _celularSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<CelularSirve>(
                          value: CelularSirve.no,
                          groupValue: _celularSirve,
                          onChanged: (CelularSirve value) {
                            setState(() {
                              _celularSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Motocicleta
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Motocicleta'),
                    SizedBox(width: motocicleta),
                    //Motocicleta
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Motocicleta>(
                          value: Motocicleta.si,
                          groupValue: _motocicleta,
                          onChanged: (Motocicleta value) {
                            setState(() {
                              _motocicleta = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Motocicleta>(
                          value: Motocicleta.no,
                          groupValue: _motocicleta,
                          onChanged: (Motocicleta value) {
                            setState(() {
                              _motocicleta = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<MotocicletaSirve>(
                          value: MotocicletaSirve.si,
                          groupValue: _motocicletaSirve,
                          onChanged: (MotocicletaSirve value) {
                            setState(() {
                              _motocicletaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<MotocicletaSirve>(
                          value: MotocicletaSirve.no,
                          groupValue: _motocicletaSirve,
                          onChanged: (MotocicletaSirve value) {
                            setState(() {
                              _motocicletaSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Computadora
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Computadora'),
                    SizedBox(width: computadora),
                    //Computadora
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Computadora>(
                          value: Computadora.si,
                          groupValue: _computadora,
                          onChanged: (Computadora value) {
                            setState(() {
                              _computadora = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Computadora>(
                          value: Computadora.no,
                          groupValue: _computadora,
                          onChanged: (Computadora value) {
                            setState(() {
                              _computadora = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<ComputadoraSirve>(
                          value: ComputadoraSirve.si,
                          groupValue: _computadoraSirve,
                          onChanged: (ComputadoraSirve value) {
                            setState(() {
                              _computadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<ComputadoraSirve>(
                          value: ComputadoraSirve.no,
                          groupValue: _computadoraSirve,
                          onChanged: (ComputadoraSirve value) {
                            setState(() {
                              _computadoraSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Horno
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Horno'),
                    SizedBox(width: horno),
                    //Horno
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Horno>(
                          value: Horno.si,
                          groupValue: _horno,
                          onChanged: (Horno value) {
                            setState(() {
                              _horno = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Horno>(
                          value: Horno.no,
                          groupValue: _horno,
                          onChanged: (Horno value) {
                            setState(() {
                              _horno = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<HornoSirve>(
                          value: HornoSirve.si,
                          groupValue: _hornoSirve,
                          onChanged: (HornoSirve value) {
                            setState(() {
                              _hornoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<HornoSirve>(
                          value: HornoSirve.no,
                          groupValue: _hornoSirve,
                          onChanged: (HornoSirve value) {
                            setState(() {
                              _hornoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //Telefono
                Row(
                  children: <Widget>[
                    getTextQuestion(question: 'Teléfono'),
                    SizedBox(width: telefono),
                    //Telefono
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<Telefono>(
                          value: Telefono.si,
                          groupValue: _telefono,
                          onChanged: (Telefono value) {
                            setState(() {
                              _telefono = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<Telefono>(
                          value: Telefono.no,
                          groupValue: _telefono,
                          onChanged: (Telefono value) {
                            setState(() {
                              _telefono = value;
                            });
                          },
                        ),
                      ),
                    ),

                    //SIRVE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'),
                        leading: Radio<TelefonoSirve>(
                          value: TelefonoSirve.si,
                          groupValue: _telefonoSirve,
                          onChanged: (TelefonoSirve value) {
                            setState(() {
                              _telefonoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'),
                        leading: Radio<TelefonoSirve>(
                          value: TelefonoSirve.no,
                          groupValue: _telefonoSirve,
                          onChanged: (TelefonoSirve value) {
                            setState(() {
                              _telefonoSirve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                getTextQuestion(question: 'Condiciones Generales Del Equipamiento'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _Condiciones.map((condiciones) =>
                        SearchFieldListItem(condiciones.toString(), item: condiciones)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _condiciones,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x){},
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed:insertDatos,
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