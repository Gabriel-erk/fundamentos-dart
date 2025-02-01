import 'package:cadastro_usuario_flutter/database/database_helper.dart';
import 'package:cadastro_usuario_flutter/model/usuario.dart';

// UsuárioController
class UsuarioController {

  // Agora, use _garantirBancoInicializado em todas as funções que manipulam o banco
  Future<int> adicionarUsuario(Usuario usuario) async {
    // await _garantirBancoInicializado();
    final db = await DatabaseHelper().database;
    return await db.insert('usuario', usuario.toMap());
  }

  Future<int> atualizarUsuario(Usuario usuario) async {
    // await _garantirBancoInicializado();
    final db = await DatabaseHelper().database;

    return await db.update(
      "usuario",
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> deletarUsuario(Usuario usuario) async {
    // await _garantirBancoInicializado();
    final db = await DatabaseHelper().database;

    return db.delete(
      "usuario",
      where: "id = ?",
      whereArgs: [usuario.id],
    );
  }

  Future<Usuario?> obterUsuario(int id) async {
    // await _garantirBancoInicializado();
    final db = await DatabaseHelper().database;

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
    // await _garantirBancoInicializado();
    final db = await DatabaseHelper().database;

    final List<Map<String, dynamic>> mapa = await db.query("usuario");

    return List.generate(mapa.length, (i) {
      return Usuario.fromMap(mapa[i]);
    });
  }
}
