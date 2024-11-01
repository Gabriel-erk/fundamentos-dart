import 'dart:convert' as conv;

class Usuario {
  String nome;
  int idade;
  bool isEstudante;
  List<String> telefones;
  List<String> emails;

  Usuario({
    required this.nome,
    required this.idade,
    required this.isEstudante,
    required this.telefones,
    required this.emails,
  });

  // Método para converter um objeto Usuario em um mapa
  Map<String, dynamic> paraJson() {
    return {
      'nome': nome,
      'idade': idade,
      'isEstudante': isEstudante,
      'telefones': telefones,
      'emails': emails,
    };
  }

  // Método para criar um objeto Usuario a partir de um mapa
  factory Usuario.deJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      idade: json['idade'],
      isEstudante: json['isEstudante'],
      telefones: List<String>.from(json['telefones']),
      emails: List<String>.from(json['emails']),
    );
  }
}

void main(List<String> args) {
  // String JSON com múltiplos usuários
  String jsonString =
      '[{"nome":"Alice","idade":30,"isEstudante":false,"telefones":["1234-5678", "0987-6543"], "emails":["alic@gmail.com", "alices@gmail.com"]}, {"nome":"Bob","idade":25,"isEstudante":true,"telefones":["9999-1234", "9898-6565"], "emails":["bobzin@gmail.com"]},{"nome":"Carol","idade":20,"isEstudante":false,"telefones":["9696-7878", "0101-1010"], "emails":["mccarol@gmail.com", "princessCarol@gmail.com"]}]';

  // Converter a string JSON em uma lista de mapas
  List<dynamic> usuariosJson = conv.jsonDecode(jsonString);

  // Criar uma lista de objetos Usuario a partir da lista de mapas
  List<Usuario> usuarios =
      usuariosJson.map((usuarioJson) => Usuario.deJson(usuarioJson)).toList();

  for (var usuario in usuarios) {
    // Exibir os detalhes do usuário
    print(
        '''Nome: ${usuario.nome}, Idade: ${usuario.idade}, Estudante: ${usuario.isEstudante}, Telefones: ${usuario.telefones.join(', ')}, Emails: ${usuario.emails.join(', ')}''');
  }
  //Converter a lista de objetos usuario para de volta para JSON =
  String jsonSaida = conv.jsonEncode(usuarios.map((usuarioMapa) => usuarioMapa.paraJson()).toList());
  print(jsonSaida);
}
