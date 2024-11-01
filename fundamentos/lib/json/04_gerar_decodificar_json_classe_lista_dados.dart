import 'dart:convert';

class Usuario {
  String nome;
  int idade;
  bool isEstudante;

  Usuario({
    required this.nome,
    required this.idade,
    required this.isEstudante,
  });
  // Metodo para converter um objeto Usuario (objeto instanciado a partir da classe ususario) em um mapa
  // String é o tipo da chave, e dynamic o valor da chave
  Map<String, dynamic> paraJson() {
    // retornando em formato de mapa, passando para os atributos criados, o valor das variavieis de instancia criadas acima
    return {
      'nome': nome,
      'idade': idade,
      'isEstudante': isEstudante,
    };
  }

  // de = decodifica, deJson = decodifica json
  // factory é como uma classe model
  // factory Usuario (chamo o construtor de usuário e armazeno em um mapa chamado json)
  // minha factory recebe um json, decodifica ele e cria um objeto do tipo usuário
  factory Usuario.deJson(Map<String, dynamic> json) {
    // retorna um novo objeto instanciado de usuário passando as informações recebidas do objeto chamado 'json' criando anteriormente
    return Usuario(
        nome: json['nome'],
        idade: json['idade'],
        isEstudante: json['isEstudante']);
  }
}

void main(List<String> args) {
  // String JSON com vários usuários
  String jsonString =
      '[{"nome":"Alice","idade":30,"isEstudante":false}, {"nome":"Bob","idade":25,"isEstudante":true}, {"nome":"Charlie","idade":28,"isEstudante":false}]';

  // Converter a string JSON em uma lista de mapas
  List<dynamic> usuariosJson = jsonDecode(jsonString);

  // Criar a lista de objetos Usuario a partir da lista de mapas - percorre todos os objetos, tranforma-os em mapas e depois o toList converte para lista (para ficar legível para ser passado para a váriavel lista usuarios)
  List<Usuario> usuarios =
      usuariosJson.map((usuarioJson) => Usuario.deJson(usuarioJson)).toList();

  //Exibir os detalhes do usuário
  for (var usuario in usuarios) {
    print(
        '''Nome: ${usuario.nome}, Idade: ${usuario.idade}, Estudante: ${usuario.isEstudante ? "Sim" : "Não"}''');
    //Converter o objeto Usuario de volta para JSON =
    String jsonSaida = jsonEncode(usuario.paraJson());
    print(jsonSaida);
  }

  // converter o objeto usuario de volta para o json
  String jsonSaida =
      jsonEncode(usuarios.map((usuario) => usuario.paraJson()).toList());
  print(jsonSaida);
}
