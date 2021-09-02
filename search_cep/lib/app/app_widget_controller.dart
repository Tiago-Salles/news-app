import 'package:flutter/material.dart';
import 'package:news_project/app/models/cep_model.dart';
import 'package:news_project/app/repositories/api_repository.dart';

class ApiController extends ChangeNotifier {
  ApiRepository apiRepository = ApiRepository();
  bool showOptions = false;

  Widget buildScreen() {
    var buildingScreen = Future.delayed(Duration(seconds: 5));

    buildingScreen.then((value) {
      print("funcionou");
      notifyListeners();
    });
    return CircularProgressIndicator();
  }

  final SnackBar showSnack = SnackBar(
    content: Text(
      "Página carregada com sucesso!",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.green[900],
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.green[300],
    elevation: 20,
    action: SnackBarAction(
      textColor: Colors.white,
      label: "Ok",
      onPressed: () {},
    ),
  );

  Future<List<Articles>?> fetchingArticles() async {
    try {
      var resultOfFetch = apiRepository.fetchArticles();
      return resultOfFetch;
    } catch (e) {
      print(e);
    }
  }

  void refreshPage() {
    fetchingArticles();
    notifyListeners();
  }

  void changeOptions() {
    showOptions = !showOptions;
  }
}
