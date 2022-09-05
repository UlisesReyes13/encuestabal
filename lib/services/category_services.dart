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

  readCategoriesEstadosCiviles() async {
    return await _repository.readData('tb_EstadosCiviles');
  }

  readCategoriesParentesco() async {
    return await _repository.readData('tb_Parentescos');
  }

  Folio() async {
    return await _repository.readFolio('datosGenerales');
  }
}