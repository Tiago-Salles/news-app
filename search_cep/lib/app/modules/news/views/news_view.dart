import 'package:flutter/material.dart';
import 'package:news_project/app/headers/hearder.dart';
import 'package:news_project/app/repositories/api_repository.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app_widget_controller.dart';

// This method is just to see if the app state is change

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final ApiRepository _apiRepository = ApiRepository();
  int count = 0;
  void increment() {
    count++;
  }

  @override
  void initState() {
    _apiRepository.fetchArticles();
    print("State initialized");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainHeader(
      showIcon: true,
      title: "Notícias",
      child: Consumer<ApiController>(
        builder: (context, _apiController, widget) {
          if (_apiRepository.resultOfRepository != null) {
            _apiController.buildScreen();
            return Container(
              child: ListView.builder(
                itemCount: _apiRepository.resultOfRepository?.length,
                itemBuilder: (context, index) {
                  var _articles = _apiRepository.resultOfRepository?[index];

                  print(_apiRepository.resultOfRepository?.length);
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${_articles?.urlToImage}"),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Material(
                            elevation: 20,
                            child: InkWell(
                              onTap: () {
                                launch("${_articles?.url}");
                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                height: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "${_articles?.title}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                "${_articles?.description}...",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${_articles?.source?.id}...",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return _apiController.buildScreen();
          }
        },
      ),
    );
  }
}
