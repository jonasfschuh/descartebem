// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'material.dart';

class PontoColeta {
  String nome;
  String logotipo;
  String endereco;
  List<Material> materiais;

  PontoColeta(
      {required this.nome,
      required this.endereco,
      required this.logotipo,
      required this.materiais});
}
