import 'package:flutter/material.dart';

import 'ui/Home.dart';

import 'package:meu_primeiro_app/ui/Country.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter News',
      routes: {
        Country.routeName: (context) => Country(),
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }

}
