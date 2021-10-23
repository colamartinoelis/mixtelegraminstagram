import 'package:flutter/material.dart';
import 'package:mixtigrameli/Screen/HomePage.dart';
import 'package:mixtigrameli/Screen/ProfilePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(), //imposto un tema scuro per tutta la APP
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profilePage': (context) => ProfilePage(),
      },
    );
  }
}
