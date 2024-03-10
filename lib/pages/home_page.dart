import 'package:descartebem/models/pontocoleta.dart';
import 'package:descartebem/pages/home_controller.dart';
import 'package:descartebem/pages/ponto_coleta_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

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
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext context, int i) {
          final List<PontoColeta> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(
              tabela[i].logotipo,
              height: 60,
              width: 60,
              fit: BoxFit.scaleDown,
            ),
            title: Text(tabela[i].nome),
            subtitle: Text(tabela[i].endereco),
            trailing: Column(
              children: [
                for (var material in tabela[i].materiais) Text(material.nome),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PontoColetaPage(
                    key: Key(tabela[i].nome),
                    pontoColeta: tabela[i],
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(10),
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
