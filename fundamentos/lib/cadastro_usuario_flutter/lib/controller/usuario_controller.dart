import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:cadastro_usuario_flutter/model/usuario.dart';

// UsuárioController
class UsuarioController {
  static Database? _bancoDeDados;

  Future<Database> get bancoDeDados async {
    if (_bancoDeDados != null) {
      return _bancoDeDados!;
    } else {
      _bancoDeDados = await _iniciarBancoDeDados();
      return _bancoDeDados!;
    }
  }

  Future<Database> _iniciarBancoDeDados() async {
    // Verifique se o caminho está sendo obtido corretamente
    String caminho = join(await getDatabasesPath(), 'usuarios.db');
    print('Caminho do banco de dados: $caminho'); // Verifique se o caminho está correto

    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE usuario(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            email TEXT,
            senha TEXT
          )
        ''');
      },
    );
  }

  // Função para garantir que o banco foi inicializado antes de qualquer operação
  Future<void> _garantirBancoInicializado() async {
    await bancoDeDados;  // Isso garante que o banco foi inicializado
  }

  // Agora, use _garantirBancoInicializado em todas as funções que manipulam o banco
  Future<int> adicionarUsuario(Usuario usuario) async {
    await _garantirBancoInicializado();
    final db = await bancoDeDados;
    return await db.insert('usuario', usuario.toMap());
  }

  Future<int> atualizarUsuario(Usuario usuario) async {
    await _garantirBancoInicializado();
    final db = await bancoDeDados;
    return await db.update(
      "usuario",
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> deletarUsuario(Usuario usuario) async {
    await _garantirBancoInicializado();
    final db = await bancoDeDados;
    return db.delete(
      "usuario",
      where: "id = ?",
      whereArgs: [usuario.id],
    );
  }

  Future<Usuario?> obterUsuario(int id) async {
    await _garantirBancoInicializado();
    final db = await bancoDeDados;
    final List<Map<String, dynamic>> mapa = await db.query(
      "usuario",
      where: "id = ?",
      whereArgs: [id],
    );
    if (mapa.isNotEmpty) {
      return Usuario.fromMap(mapa.first);
    }
    return null;
  }

  Future<List<Usuario>> obterUsuarios() async {
    await _garantirBancoInicializado();
    final db = await bancoDeDados;
    final List<Map<String, dynamic>> mapa = await db.query("usuario");

    return List.generate(mapa.length, (i) {
      return Usuario.fromMap(mapa[i]);
    });
  }
}