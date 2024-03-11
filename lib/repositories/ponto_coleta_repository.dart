import 'dart:collection';

import 'package:descartebem/models/pontocoleta.dart';
import 'package:flutter/material.dart';

import '../models/material_.dart';

class PontoColetaRepository extends ChangeNotifier {
  final List<PontoColeta> _pontoscoleta = [];

  UnmodifiableListView<PontoColeta> get pontoscoleta =>
      UnmodifiableListView(_pontoscoleta);

  void addMaterial(
      {required PontoColeta pontocoleta, required Material_ material}) {
    pontocoleta.materiais.add(material);
    notifyListeners();
  }

  void editMaterial(
      {required Material_ material,
      required String ano,
      required String nome}) {
    material.nome = ano;
    material.nome = nome;
    //material.ano = ano;
    notifyListeners();
  }

  PontoColetaRepository() {
    _pontoscoleta.addAll(
      [
        PontoColeta(
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
          nome: 'Giassi',
          endereco: 'Avenida São Paulo, 2500',
          logotipo: 'https://institucional.giassi.com.br/img/facebook.jpg',
          materiais: [
            Material_(nome: 'Lâmpada'),
            Material_(nome: 'Bateria'),
          ],
        ),
        PontoColeta(
          nome: 'Cooper',
          endereco: 'Rua Benjamin Constant, 2480',
          logotipo:
              'https://www.cooper.coop.br/image/13823/550/0/novos-horarios-de-atendimento-da-cooper.jpg',
          materiais: [
            Material_(nome: 'Lâmpada'),
          ],
        ),
        PontoColeta(
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
          nome: 'Prefeitura Municipal de Blumenau',
          endereco: 'Avenida Beira Rio, 4032',
          logotipo:
              'https://www.blumenau.sc.gov.br/view/media/up/25770b457a11b77d1ac8254e89b3790a.png',
          materiais: [
            Material_(nome: 'Lâmpada'),
            Material_(nome: 'Bateria'),
          ],
        ),
      ],
    );
  }
}
