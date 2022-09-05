class GradosEscolaresModel {
  String grado;

  GradosEscolaresModel({this.grado});

  Map<String, dynamic> toMap() {
    return {
      'grado': grado
    };
  }
  GradosEscolaresModel.fromMap(Map<String, dynamic> map) {
    grado = map['grado'];
  }
}