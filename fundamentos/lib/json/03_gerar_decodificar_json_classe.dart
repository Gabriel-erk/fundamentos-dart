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
  //String json com um único usuário
  String jsonString = '{"nome":"Alice","idade":30,"isEstudante":false}';
  //COnverter a string json em um mapa
  Map<String, dynamic> usuarioJson = jsonDecode(jsonString);
  //Criar um objeto Usuario a partid do mapa
  Usuario usuario = Usuario.deJson(usuarioJson);
  //Exibir os detalhes do usuário
  print(
      '''Nome: ${usuario.nome}, Idade: ${usuario.idade}, Estudante: ${usuario.isEstudante}''');
  //Converter o objeto Usuario de volta para JSON =
  String jsonSaida = jsonEncode(usuario.paraJson());
  print(jsonSaida);
}
