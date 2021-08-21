import 'package:flutter/material.dart';
import 'package:search_cep/app/headers/hearder.dart';
import 'package:search_cep/app/modules/home/widgets/body_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainHeader(
      child: BodyHome(),
    );
  }
}
