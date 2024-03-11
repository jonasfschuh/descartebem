// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/material_.dart';
import '../repositories/ponto_coleta_repository.dart';

// ignore: must_be_immutable
// Exemplo de tela modal
class EditMaterialPage extends StatefulWidget {
  Material_ material;

  EditMaterialPage({super.key, required this.material});

  @override
  State<EditMaterialPage> createState() => _EditMaterialPageState();
}

class _EditMaterialPageState extends State<EditMaterialPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ano.text = '';
    _campeonato.text = widget.material.nome;
  }

  editar() {
    // o listem está falso por que vai adicionar apenas. Mas se precisasse atualizar alguma outra tela,
    // deve estar true. Porque esse método save não vai precisar renderizar nada novamente.
    //Provider.of<PontoColetaRepository>(context, listen: false).addMaterial(
    Provider.of<PontoColetaRepository>(context, listen: false).editMaterial(
      material: widget.material,
      nome: _campeonato.text,
      ano: '',
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar material'),
        //backgroundColor: Colors.grey[800],
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: editar),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantidade',
                ),
                //keyboardType: TextInputType.number,
                validator: (value) {
                  //if (value!.isEmpty) {
                  //  return 'Informe o ano do título!';
                  //}
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: TextFormField(
                controller: _campeonato,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o campeonato!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
