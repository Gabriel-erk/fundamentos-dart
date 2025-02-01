import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // método estático para criar uma instância da classe (dentro da classe posso criar uma instância de databaseHelper, fora, não, e como é estaático, posso chamar em qualquer lugar do programa que vai ter esse mesmo valor)
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  // váriavel estatica que pode ser nulla (por conta do ?) e é privada por conta do _
  static Database? _database;

  // construtor privado, fazendo com que não se possa criar instâncias dessa classe
  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    // se a database já foi criada, retorna ela
    if (_database != null) {
      return _database!;
    }
    // se não cria ele com o metodo initDataBase
    _database = await _initDataBase();
    return _database!;
  }

  Future<Database> _initDataBase() async {
    // nosso banco de dados é usuários, getDatabase verifica o caminho de armazenamento do banco de dados de cada dispositivo (cada SO tem um, que será juntado com 'usuarios.db')
    String caminho = join(await getDatabasesPath(), 'usuarios.db');

    // abrindo banco d dados
    return await openDatabase(caminho, // o caminho do banco de dados
        version:
            1, // a versão do banco de dados (caso atualize o banco, altero isso)
        onCreate: (db, version) async {
      // função anônima assincrona passando o banco de dados e a versão
      await db.execute(''' 
        CREATE TABLE usuario(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL,
          email TEXT NOT NULL,
          senha TEXT NOT NULL
        )
      ''');
    });
  }
}
