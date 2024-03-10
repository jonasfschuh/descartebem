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
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black26,
          indicatorColor: Colors.white,
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
