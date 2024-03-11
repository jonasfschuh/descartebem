// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/material_.dart';
import '../models/pontocoleta.dart';

class AddMaterialPage extends StatefulWidget {
  late PontoColeta pontoColeta;

  // ignore: use_super_parameters
  AddMaterialPage({Key? key, required this.pontoColeta}) : super(key: key);

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}

class _AddMaterialPageState extends State<AddMaterialPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  save() {
    // o listem está falso por que vai adicionar apenas. Mas se precisasse atualizar alguma outra tela,
    // deve estar true. Porque esse método save não vai precisar renderizar nada novamente.
    //Provider.of<PontoColetaRepository>(context, listen: false).addMaterial(
    Provider.of<PontoColetaRepository>(context, listen: false).addMaterial(
      pontocoleta: widget.pontoColeta,
      material: Material_(
        nome: _campeonato.text,
      ),
    );

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Salvo com sucesso!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar material'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantidade',
                ),
                keyboardType: TextInputType.number,
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
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24),
              child: ElevatedButton(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.check),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    save();
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
