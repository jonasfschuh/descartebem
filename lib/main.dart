import 'package:descartebem/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DescarteBem());
}

class DescarteBem extends StatelessWidget {
  const DescarteBem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Descarte bem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
