import 'package:descartebem/repositories/ponto_coleta_repository.dart';

import '../models/pontocoleta.dart';

// essa classe não é mais utilizada. Deverá ser excluída mais pra frente.
class HomeController {
  late PontoColetaRepository pontoColetaRepository;

  List<PontoColeta> get tabela => pontoColetaRepository.pontoscoleta;

  HomeController() {
    pontoColetaRepository = PontoColetaRepository();
    //   tabela = [
    //     PontoColeta(
    //       nome: 'FURB',
    //       endereco: 'Rua Antônio da Veiga, 100',
    //       logotipo:
    //           'https://www.furb.br/_upl/files/multimidia/furb_universidade%20de%20Blumenau_policromia.jpg',
    //       materiais: [
    //         Material(nome: 'Lâmpada'),
    //         Material(nome: 'Bateria'),
    //         Material(nome: 'Eletrônicos'),
    //       ],
    //     ),
    //     PontoColeta(
    //       nome: 'Giassi',
    //       endereco: 'Avenida São Paulo, 2500',
    //       logotipo: 'https://institucional.giassi.com.br/img/facebook.jpg',
    //       materiais: [
    //         Material(nome: 'Lâmpada'),
    //         Material(nome: 'Bateria'),
    //       ],
    //     ),
    //     PontoColeta(
    //       nome: 'Cooper',
    //       endereco: 'Rua Benjamin Constant, 2480',
    //       logotipo:
    //           'https://www.cooper.coop.br/image/13823/550/0/novos-horarios-de-atendimento-da-cooper.jpg',
    //       materiais: [
    //         Material(nome: 'Lâmpada'),
    //       ],
    //     ),
    //     PontoColeta(
    //       nome: 'Angeloni',
    //       endereco: 'Rua Humberto de Campos, 19',
    //       logotipo:
    //           'https://biscoitosgusman.com.br/wp-content/uploads/2021/04/Logo-Angeloni.png',
    //       materiais: [
    //         Material(nome: 'Lâmpada'),
    //         Material(nome: 'Bateria'),
    //         Material(nome: 'Eletrônicos'),
    //       ],
    //     ),
    //     PontoColeta(
    //       nome: 'Prefeitura Municipal de Blumenau',
    //       endereco: 'Avenida Beira Rio, 4032',
    //       logotipo:
    //           'https://www.blumenau.sc.gov.br/view/media/up/25770b457a11b77d1ac8254e89b3790a.png',
    //       materiais: [
    //         Material(nome: 'Lâmpada'),
    //         Material(nome: 'Bateria'),
    //       ],
    //     ),
    //   ];
  }
}

/*

ENTIDADE
	idEntidade 
	nomeFantasia
	CNPJ
	endereco
	email
	telefone
	dataAtualizacao

https://descartebem-default-rtdb.firebaseio.com/entidade.json
{
    "nomeFantasia": "Fundação Universidade Regional de Blumenau",
    "CNPJ": "01020150500",
    "endereco": "Rua Antonio da Veiga, 100",
    "email": "furb@furb.br",
    "telefone": "47 3200 0000",
    "dataAtualizacao": "2019-07-22T16:00:04.8579075",
    "dataRegistro": "2019-07-22T16:00:04.8579075",
    "dataAlteracao": "2019-07-22T16:00:04.8579075",
    "dataAtivacao": "2019-07-22T16:00:04.8579075",
    "status": "Ativo",
    "entidade": "FURB",
    "pontosColeta": [
        {
            "nome": "Bloco B",
            "endereco": "Benjamin Constant, 2638",
            "materiais": [
                {
                    "nome": "Lampadas"
                },
                {
                    "nome": "Pilhas"
                },
                {
                    "nome": "Baterias"
                }
            ]
        }
    ]
},
{
    "nomeFantasia": "Cooper Vila Nova",
    "CNPJ": "01020150500",
    "endereco": "Rua Antonio da Veiga, 100",
    "email": "furb@furb.br",
    "telefone": "47 3200 0000",
    "dataAtualizacao": "2019-07-22T16:00:04.8579075",
    "dataRegistro": "2019-07-22T16:00:04.8579075",
    "dataAlteracao": "2019-07-22T16:00:04.8579075",
    "dataAtivacao": "2019-07-22T16:00:04.8579075",
    "status": "Ativo",
    "entidade": "FURB",
    "pontosColeta": [
        {
            "nome": "Bloco B",
            "endereco": "Benjamin Constant, 2638",
            "materiais": [
                {
                    "nome": "Lampadas"
                },
                {
                    "nome": "Pilhas"
                },
                {
                    "nome": "Baterias"
                }
            ]
        }
    ]
},
{
    "nomeFantasia": "Cooper Velha",
    "CNPJ": "01020150500",
    "endereco": "Rua Antonio da Veiga, 100",
    "email": "furb@furb.br",
    "telefone": "47 3200 0000",
    "dataAtualizacao": "2019-07-22T16:00:04.8579075",
    "dataRegistro": "2019-07-22T16:00:04.8579075",
    "dataAlteracao": "2019-07-22T16:00:04.8579075",
    "dataAtivacao": "2019-07-22T16:00:04.8579075",
    "status": "Ativo",
    "entidade": "FURB",
    "pontosColeta": [
        {
            "nome": "Bloco B",
            "endereco": "Benjamin Constant, 2638",
            "materiais": [
                {
                    "nome": "Lampadas"
                },
                {
                    "nome": "Pilhas"
                },
                {
                    "nome": "Baterias"
                }
            ]
        }
    ]
},
{
    "nomeFantasia": "Giassi Supermercados",
    "CNPJ": "01020150500",
    "endereco": "Rua Antonio da Veiga, 100",
    "email": "furb@furb.br",
    "telefone": "47 3200 0000",
    "dataAtualizacao": "2019-07-22T16:00:04.8579075",
    "dataRegistro": "2019-07-22T16:00:04.8579075",
    "dataAlteracao": "2019-07-22T16:00:04.8579075",
    "dataAtivacao": "2019-07-22T16:00:04.8579075",
    "status": "Ativo",
    "entidade": "FURB",
    "pontosColeta": [
        {
            "nome": "Bloco B",
            "endereco": "Benjamin Constant, 2638",
            "materiais": [
                {
                    "nome": "Lampadas"
                },
                {
                    "nome": "Pilhas"
                },
                {
                    "nome": "Baterias"
                }
            ]
        }
    ]	
},
{
	"nomeFantasia": "Prefeitura Municipal de Blumenau ",
    "CNPJ": "01020150500",
    "endereco": "Rua Antonio da Veiga, 100",
    "email": "furb@furb.br",
    "telefone": "47 3200 0000",
    "dataAtualizacao": "2019-07-22T16:00:04.8579075",
    "dataRegistro": "2019-07-22T16:00:04.8579075",
    "dataAlteracao": "2019-07-22T16:00:04.8579075",
    "dataAtivacao": "2019-07-22T16:00:04.8579075",
    "status": "Ativo",
    "entidade": "FURB",
    "pontosColeta": [
        {
            "nome": "Bloco B",
            "endereco": "Benjamin Constant, 2638",
            "materiais": [
                {
                    "nome": "Lampadas"
                },
                {
                    "nome": "Pilhas"
                },
                {
                    "nome": "Baterias"
                }
            ]
        }
    ]
}


*/
