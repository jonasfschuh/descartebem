import 'dart:collection';

import 'package:descartebem/models/pontocoleta.dart';
import 'package:flutter/material.dart';

import '../database/db.dart';
import '../models/material_.dart';

class PontoColetaRepository extends ChangeNotifier {
  final List<PontoColeta> _pontoscoleta = [];

  UnmodifiableListView<PontoColeta> get pontoscoleta =>
      UnmodifiableListView(_pontoscoleta);

  void addMaterial(
      {required PontoColeta pontocoleta, required Material_ material}) async {
    var db = await DB.get();
    int id = await db.insert('ponto_coleta_material', {
      'material': material.nome,
      'ponto_coleta_id': pontocoleta.id,
    });
    material.id = id;
    pontocoleta.materiais.add(material);
    notifyListeners();
  }

  void editMaterial(
      {required Material_ material,
      required String ano,
      required String nome}) async {
    var db = await DB.get();

    await db.update(
      'ponto_coleta_material',
      {'material': nome},
      where: 'id = ?',
      whereArgs: [material.id],
    );

    material.nome = ano;
    material.nome = nome;
    //material.ano = ano;
    notifyListeners();
  }

  static setupPontosColeta() {
    return [
      PontoColeta(
        id: 1,
        nome: 'FURB',
        endereco: 'Rua Antônio da Veiga, 100',
        logotipo:
            'https://www.furb.br/_upl/files/multimidia/furb_universidade%20de%20Blumenau_policromia.jpg',
        materiais: [
          Material_(nome: 'Lâmpada'),
          Material_(nome: 'Bateria'),
          Material_(nome: 'Eletrônicos'),
        ],
      ),
      PontoColeta(
        id: 2,
        nome: 'Giassi',
        endereco: 'Avenida São Paulo, 2500',
        logotipo: 'https://institucional.giassi.com.br/img/facebook.jpg',
        materiais: [
          Material_(nome: 'Lâmpada'),
          Material_(nome: 'Bateria'),
        ],
      ),
      PontoColeta(
        id: 3,
        nome: 'Cooper',
        endereco: 'Rua Benjamin Constant, 2480',
        logotipo:
            'https://www.cooper.coop.br/image/13823/550/0/novos-horarios-de-atendimento-da-cooper.jpg',
        materiais: [
          Material_(nome: 'Lâmpada'),
        ],
      ),
      PontoColeta(
        id: 4,
        nome: 'Angeloni',
        endereco: 'Rua Humberto de Campos, 19',
        logotipo:
            'https://biscoitosgusman.com.br/wp-content/uploads/2021/04/Logo-Angeloni.png',
        materiais: [
          Material_(nome: 'Lâmpada'),
          Material_(nome: 'Bateria'),
          Material_(nome: 'Eletrônicos'),
        ],
      ),
      PontoColeta(
        id: 5,
        nome: 'Prefeitura Municipal de Blumenau',
        endereco: 'Avenida Beira Rio, 4032',
        logotipo:
            'https://www.blumenau.sc.gov.br/view/media/up/25770b457a11b77d1ac8254e89b3790a.png',
        materiais: [
          Material_(nome: 'Lâmpada'),
          Material_(nome: 'Bateria'),
        ],
      ),
    ];
  }

  PontoColetaRepository() {
    //_pontoscoleta.addAll(setupPontosColeta());
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List pontoscoleta = await db.query('ponto_coleta');
    // Equivalente a db.rawQuery('SELECT * FROM ponto_coleta');
    for (var pontocoleta in pontoscoleta) {
      _pontoscoleta.add(
        PontoColeta(
            id: pontocoleta['id'],
            nome: pontocoleta['nome'],
            endereco: pontocoleta['endereco'],
            logotipo: pontocoleta['logotipo'],
            materiais: await getMateriais(pontocoleta['id'])),
      );
    }
    notifyListeners();
  }

  getMateriais(pontoColetaId) async {
    var db = await DB.get();
    var results = await db.query('ponto_coleta_material',
        where: 'ponto_coleta_id = ?', whereArgs: [pontoColetaId]);
    List<Material_> materiais = [];
    for (var material in results) {
      materiais.add(Material_(
        id: material['id'],
        nome: material['material'],
      ));
    }
    return materiais;
  }
}
