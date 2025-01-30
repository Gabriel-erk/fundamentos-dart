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

  Future<int> atualizarUsuario(Usuario usuario) async {
    final db = await bancoDeDados; // pegando instância do banco de dados
    return await db.update(
        'usuario', // tabela que vai atualizar
        usuario.toMap(), // metodo para mapear o objeto do usuário
        where:
            'id = ?', // condição para atualizar (uma interrogação significa que irei passar só um argumento)
        whereArgs: [
          usuario.id
        ]); // aqui estou passando os argumentos que pedi (no caso o id)
  }

  // Excluir o usuário
  Future<int> deletarUsuario(Usuario usuario) async {
    final db = await bancoDeDados;
    return await db.delete('usuario', // tabela
        where: 'id = ?', // condição (id do usuário)
        whereArgs: [usuario.id]); // passando o conteúdo para a condição
  }

  // Buscar dados do usuário através do id, ? pois  é um nullable, ela permite que o valor retornado seja nullo, pois existe a possiblidade de não ser passado/não encontrar o id, então a interrogação me permite retornar um valor nulo
  Future<Usuario?> obterUsuario(int id) async {
    final db = await bancoDeDados;
    // criando uma lista que possui vários mapas (porém só me interesso no primeiro) - mwu db.query retorna uma lista de mapas, por isso é importante criar "mapa" pois ela é uma lista de mapas e assim irá receber db.query corretamente
    final List<Map<String, dynamic>> mapa =
        await db.query("usuario", where: "id = ?", whereArgs: [id]);
    // se o mapa não estiver vazio, então é porque o usuário foi encontrado, então retorna um novo objeto do tipo usuário a partir de um mapa (do primeiro item da lista de mapas)
    if (mapa.isNotEmpty) {
      return Usuario.fromMap(mapa.first);
    }
    // pega todos os usuários
    Future<List<Usuario>> obterUsuarios() async {
      // pega a instância que faz conexão com o banco
      final db = await bancoDeDados;
      // pega todos os usuários
      final List<Map<String, dynamic>> mapa = await db.query("usuario");

      // primeiro argumento da função generate é o tamanho (aqui o tamanho do meu mapa, que significa o tanto de usuários retornados), segundo estou passando uma função anônima como parâmetro i, que irá ser executada para cada item do meu mapa, então crio um usuário a partir do mapa e o i é o responsável por alterar a posição percorrida, dps desse processo o usuário criado é jogado na lista
      return List.generate(mapa.length, (i){
        return Usuario.fromMap(mapa[i]);
      });
    }
  }
}
