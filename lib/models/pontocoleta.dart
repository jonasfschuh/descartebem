// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'material_.dart';

class PontoColeta {
  String nome;
  String logotipo;
  String endereco;
  List<Material_> materiais;

  PontoColeta(
      {required this.nome,
      required this.endereco,
      required this.logotipo,
      required this.materiais});
}
