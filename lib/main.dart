import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  runApp(const Newsapp());
}

class Newsapp extends StatelessWidget {
  const Newsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: News(),
    );
  }
}