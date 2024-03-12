import 'package:descartebem/controllers/theme_controller.dart';
import 'package:descartebem/models/pontocoleta.dart';
//import 'package:descartebem/pages/home_controller.dart';
import 'package:descartebem/pages/ponto_coleta_page.dart';
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
import 'package:descartebem/widget/logotipo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var controller = HomeController();
  var controller = ThemeController.to;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Descarte Bem'),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(() => controller.isDark.value
                      ? Icon(Icons.brightness_7)
                      : Icon(Icons.brightness_2)),
                  title: Obx(() =>
                      controller.isDark.value ? Text('Light') : Text('Dark')),
                  onTap: () => controller.changeTheme(),
                ),
              ),
            ],
          ),
        ],
      ),
      // sempre usar o consumer perto da classe que irá usar
      body: Consumer<PontoColetaRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.pontoscoleta.length,
            itemBuilder: (BuildContext context, int i) {
              final List<PontoColeta> tabela = repositorio.pontoscoleta;
              return ListTile(
                leading: Logotipo(image: tabela[i].logotipo, width: 60),
                // Image.network(
                //   tabela[i].logotipo,
                //   height: 60,
                //   width: 60,
                //   fit: BoxFit.scaleDown,
                //),
                title: Text(tabela[i].nome),
                subtitle: Text(tabela[i].endereco),
                trailing: Column(
                  children: [
                    for (var material in tabela[i].materiais)
                      Text(
                        material.nome,
                        style: TextStyle(fontSize: 9),
                      ),
                  ],
                ),
                onTap: () {
                  Get.to(
                    () => PontoColetaPage(
                      key: Key(tabela[i].nome),
                      pontoColeta: tabela[i],
                    ),
                  );

                  //substituido pelo GET
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => PontoColetaPage(
                  //       key: Key(tabela[i].nome),
                  //       pontoColeta: tabela[i],
                  //     ),
                  //   ),
                  // );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            padding: EdgeInsets.all(10),
          );
        },
      ),
      //floatingActionButton: ,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Mais',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[500],
        onTap: _onItemTapped,
      ),
    );
  }
}
