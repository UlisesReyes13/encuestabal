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

  readCategoriesEcolaridades() async {
    return await _repository.readData('tb_Escolaridades');
  }

  readCategoriesDerechohabiencias() async {
    return await _repository.readData('tb_Derechohabiencias');
  }

  readCategoriesMotivoDerechohabiencias() async {
    return await _repository.readData('tb_MotivoDerechohabiencias');
  }
  
  readCategoriesTipoEmpleos() async {
    return await _repository.readData('tb_TipoEmpleos');
  }

  readCategoriesOcupaciones() async {
    return await _repository.readData('tb_Ocupaciones');
  }

  readCategoriesGradosEscolares() async {
    return await _repository.readData('tb_GradosEscolares');
  }
  
  readCategoriesDiscapacidades() async {
    return await _repository.readData('tb_CapacidadesDiferentes');
  }
  
  readCategoriesCondicionesSalud() async{
    return await _repository.readData('tb_CondicionesSalud');
  }
  
  readCategoriesAdicciones() async{
    return await _repository.readData('tb_Adicciones');
  }
  
  readCategoriesPuebloIndigena() async {
    return await _repository.readData('tb_EtniasIndigenas');
  }
}