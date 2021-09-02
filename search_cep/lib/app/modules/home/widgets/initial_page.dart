import 'package:flutter/material.dart';
import 'package:news_project/app/modules/news/views/news_view.dart';

import '../../../app_widget_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final ApiController _apiController = ApiController();

  void initState() {
    print("State initialized");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
            Positioned(
              left: 250,
              width: 85,
              height: 200,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    height: 70,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _apiController.changeOptions();
                          });
                        },
                        iconSize: 70,
                        icon: _apiController.showOptions
                            ? Icon(Icons.arrow_drop_up)
                            : Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  _apiController.showOptions
                      ? Expanded(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 20,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo[100],
                                  borderRadius: BorderRadius.circular(10)),
                              height: 150,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      _apiController.buildScreen();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsView(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Notícias",
                                      style: TextStyle(
                                        color: Colors.indigo[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                              "Dados publicos indisponível",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Dados Púclicos",
                                      style: TextStyle(
                                        color: Colors.indigo[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
