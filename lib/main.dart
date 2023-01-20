import 'package:backgrounds/src/pages/animaciones_page.dart';
// import 'package:backgrounds/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños',
        home: AnimacionesPage());
  }
}
