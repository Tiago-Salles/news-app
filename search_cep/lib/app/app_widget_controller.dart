import 'package:search_cep/app/models/cep_model.dart';
import 'package:search_cep/app/repositories/cep_repository.dart';

class Controller {
  final ApiRepository apiRepository = ApiRepository();
  late Future<ApiModel?> resultOfSearch;

  Future<ApiModel?> fetchingData() async {
    try {
      var result = apiRepository.fetchData();
      resultOfSearch = result;
      return resultOfSearch;
    } catch (e) {
      throw "$e";
    }
  }
}
