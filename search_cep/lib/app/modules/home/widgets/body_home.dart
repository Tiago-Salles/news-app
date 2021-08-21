import 'package:flutter/material.dart';
import 'package:search_cep/app/models/cep_model.dart';
import '../../../app_widget_controller.dart';

class BodyHome extends StatelessWidget {
  BodyHome({Key? key}) : super(key: key);
  final Controller _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiModel?>(
      future: _controller.fetchingData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 500,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data!.title}"),
                  Text("${snapshot.data!.userId}"),
                  Text("${snapshot.data!.id}"),
                  Text("${snapshot.data!.completed}"),
                ],
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
