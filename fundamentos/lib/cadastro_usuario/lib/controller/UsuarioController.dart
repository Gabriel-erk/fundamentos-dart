import 'package:cadastro_usuario/model/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UsuarioController {
  // static é para ter o mesmo valor em todas as instâncias, em toda a aplicação, onde chamar essa váriavel ela terá este valor
  static Database? _bancoDedados;

  Future<Database> get bancoDeDados async {
    // basicamente se já tiver um banco de dados, retorna as info já existentes
    if (_bancoDedados != null) {
      return _bancoDedados!;
    } else {
      // se não cria um do 0 xhamando o método que inicia o banco
      _bancoDedados = await _iniciarBancoDeDados();
      // ! é para ignorar o fato que pode ser nullo (basicamente vou garantir que não vai ser)
      return _bancoDedados!;
    }
  }

  // vai retornar um database, e é asincrono (essa é uma função futura)
  Future<Database> _iniciarBancoDeDados() async {
    // await só retorna algo após carregar tudo (aqui basicamente inicia todo o banco de dados)
    String caminho = join(await getDatabasesPath(), 'usuarios.db');
    return await openDatabase(caminho, version: 1,
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE usuario(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         nome TEXT,
         email TEXT,
         senha TEXT,
        )
        ''');
    }); // abre o banco de dados
  }

// função futura com o retorno do tipo int, que vai retornar a quantidade de inserts no banco
  Future<int> adicionarUsuario(Usuario usuario) async {
    // sempre que for criar um usuário chamar a instancia do banco,
    final db = await bancoDeDados;
    // o usuario é o que vai ser inserido no banco com o método toMap, que vai converter as informações do tipo usuário para um mapa (da forma que o sqlite consegue ler)
    // é inserido com o método insert, na tabela 'usuario'
    return await db.insert('usuario', usuario.toMap());
  }
}
