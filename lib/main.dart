import 'package:descartebem/controllers/theme_controller.dart';
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
/**
 * Tutorial das libs 
 * https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=pt-br#3
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'config.dart';
import 'widget/checkauth.dart';

void main() async {
  await initConfigurations();
  //initializeFirebase();

  //Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(
    // MultiProvider MultiProvider(providers: providers)
    ChangeNotifierProvider(
      create: (context) => PontoColetaRepository(),
      child: DescarteBem(),
    ),
  );
}
/*
Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
*/

class DescarteBem extends StatelessWidget {
  const DescarteBem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green[100],
        ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.white,
        //accentColor,
        //accentIconTheme,
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent[100]),
        ),
      ),
      //home: HomePage(),
      home: CheckAuth(),
    );
  }
}
