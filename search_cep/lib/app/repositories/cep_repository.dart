import 'package:get/get_connect.dart';
import 'package:search_cep/app/models/cep_model.dart';

class ApiRepository extends GetConnect {
  Future<ApiModel?> fetchData() async {
    final response = await get("https://jsonplaceholder.typicode.com/todos/1");
    print(response.body);
    return ApiModel.fromJson(response.body);
  }
}
