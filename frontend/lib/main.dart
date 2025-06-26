import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PourHouseApp());
}

class PourHouseApp extends StatelessWidget {
  const PourHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'PourHouse Wine App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}
