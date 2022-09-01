import 'package:encuestabal/DatabaseHandler/DbHelper.dart';

class CategoryService {
  DbHelper _repository;
  CategoryService(){
    _repository = DbHelper();
  }

  readCtegoriesNomAsen() async {
    return await _repository.readData('Asentamientos');
  }

  readCtegoriesTipoVialidad() async {
    return await _repository.readData('TiposVialidad');
  }

  readCtegoriesMunicipios() async {
    return await _repository.readData('tb_Municipios');
  }

  readCtegoriesTipoAsentamiento() async {
    return await _repository.readData('TiposAsentamiento');
  }
}