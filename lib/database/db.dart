import 'package:descartebem/models/pontocoleta.dart';
import 'package:descartebem/repositories/ponto_coleta_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    String path = await getDatabasesPath().toString();
    print(path);
    return await openDatabase(
      join(await getDatabasesPath(), 'dados.db'),
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(pontoColeta);
        await db.execute(material);
        await setupPontosColeta(db);
      },
    );
  }

  setupPontosColeta(db) {
    for (PontoColeta pontoColeta in PontoColetaRepository.setupPontosColeta()) {
      db.insert('ponto_coleta', {
        'nome': pontoColeta.nome,
        'endereco': pontoColeta.endereco,
        'logotipo': pontoColeta.logotipo,
      });
    }
  }

  String get pontoColeta => '''
    CREATE TABLE ponto_coleta(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      nome TEXT, 
      endereco TEXT,
      logotipo TEXT 
    );
  ''';

  String get material => '''
    CREATE TABLE ponto_coleta_material(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      material TEXT,       
      ponto_coleta_id INTEGER, 
      FOREIGN KEY (ponto_coleta_id) REFERENCES ponto_coleta(id) ON DELETE CASCADE
    );
  ''';
}
