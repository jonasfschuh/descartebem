// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:descartebem/models/pontocoleta.dart';
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_material_page.dart';

// ignore: must_be_immutable
class PontoColetaPage extends StatefulWidget {
  late PontoColeta pontoColeta;

  PontoColetaPage({Key? key, required this.pontoColeta}) : super(key: key);

  @override
  State<PontoColetaPage> createState() => _PontoColetaPageState();
}

class _PontoColetaPageState extends State<PontoColetaPage> {
  materialPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddMaterialPage(
          pontoColeta: widget.pontoColeta,
        ),
      ),
    );
  }

  // comentado porque o provider irá tratar de outra forma
  // addMaterial(Material_ material) {
  //   setState(
  //     () {
  //       widget.pontoColeta.materiais.add(material);
  //     },
  //   );

  //   Navigator.pop(context);

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Salvo com sucesso!'),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.pontoColeta.nome),
            actions: [
              IconButton(onPressed: materialPage, icon: Icon(Icons.add))
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.info),
                  text: 'Informações',
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'Materiais',
                ),
                Tab(
                  icon: Icon(Icons.map),
                  text: 'Mapa',
                ),
              ],
              //indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Image.network(widget.pontoColeta.logotipo),
                ),
                Text(widget.pontoColeta.nome),
                Text(widget.pontoColeta.endereco),
              ],
            ),
            materiais(),
            Container(
              child: Text('mapa'),
            ),
          ])),
    );
  }

  Widget materiais() {
    final pontoColeta = Provider.of<PontoColetaRepository>(context)
        .pontoscoleta
        .firstWhere((t) => t.nome == widget.pontoColeta.nome);
    final quantidade = pontoColeta.materiais.length;
    //final quantidade = widget.pontoColeta.materiais.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Nenhum material cadastrado!'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(pontoColeta.materiais[index].nome),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
