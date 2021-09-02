import 'package:flutter/material.dart';
import 'package:news_project/app/headers/hearder.dart';
import 'package:news_project/app/modules/home/widgets/initial_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainHeader(
      showIcon: false,
      title: "Página Incial",
      child: InitialPage(),
    );
  }
}
