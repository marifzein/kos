//import 'dart:developer';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kos/login.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/entities/objectbox.dart';

late Store store;
//late Store store; //
//void main() async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = (await ObjectBox.create()).store;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KosKu',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffc94b4b)),
          useMaterial3: true),
      home: LoginPage(),
      /* home: Scaffold(
        appBar: AppBar(
          title: Text('main.dart'),
        ),
        body: Container(
          color: Colors.redAccent,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'first',
                style: TextStyle(color: Colors.white),
              ),
              Text('second'),
            ],
          ),
        ),
      ), */
    );
  }
}
