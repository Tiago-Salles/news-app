import 'package:dio/dio.dart';
import 'package:news_project/app/models/cep_model.dart';

class ApiRepository {
  Dio dio = Dio();
  String apiKey = "87e92d2ff9594565a500ea12beb63e5b";
  String apiEndPoint =
      "https://newsapi.org/v2/top-headlines?sources=google-news-br&apiKey=";

  List<Articles>? resultOfRepository = [];

  Future<List<Articles>?> fetchArticles() async {
    final response = await dio.get(apiEndPoint + apiKey);
    ApiModel data = ApiModel.fromJson(response.data);
    resultOfRepository = data.articles;

    // This print is just to see if the API is returning all right.
    print("${resultOfRepository?.length} and ${resultOfRepository?[0].title}");

    return resultOfRepository;
  }
}
