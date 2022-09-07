class PrestacionesLaboralesModel{
  String prestacion;
  bool value;

  PrestacionesLaboralesModel({this.prestacion, this.value = false});

  @override
  String toString() => prestacion;
}