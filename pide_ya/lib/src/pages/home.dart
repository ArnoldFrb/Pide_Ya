import 'package:flutter/material.dart';
import 'package:pide_ya/src/pages/home_people.dart';
import 'package:pide_ya/src/pages/home_store.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool op = true;
    if (op == true) {
      return HomePPage('');
    } else {
      return HStorePage();
    }
  }
}
