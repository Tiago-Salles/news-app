import 'package:flutter/material.dart';
import 'package:search_cep/app/app_widget_controller.dart';

class MainHeader extends StatelessWidget {
  MainHeader({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final Controller _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchCep"),
        actions: [
          IconButton(
            onPressed: _controller.fetchingData,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: child,
    );
  }
}
