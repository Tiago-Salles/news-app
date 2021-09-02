import 'package:flutter/material.dart';
import 'package:news_project/app/modules/news/views/news_view.dart';
import 'package:provider/provider.dart';
import '../app_widget_controller.dart';

class MainHeader extends StatelessWidget {
  MainHeader({
    Key? key,
    required this.child,
    required this.title,
    required this.showIcon,
  }) : super(key: key);
  final Widget child;
  final String title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final ApiController _apiController = Provider.of<ApiController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
        ),
        actions: [
          showIcon
              ? IconButton(
                  onPressed: () {
                    _apiController.notifyListeners();
                    print("clicou");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(_apiController.showSnack);
                  },
                  icon: Icon(Icons.refresh),
                  iconSize: 30,
                )
              : Container(),
        ],
      ),
      body: child,
    );
  }
}
