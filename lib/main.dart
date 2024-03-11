import 'package:descartebem/pages/home_page.dart';
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MultiProvider MultiProvider(providers: providers)
    ChangeNotifierProvider(
      create: (context) => PontoColetaRepository(),
      child: DescarteBem(),
    ),
  );
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
