import 'dart:convert';

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
  // Metodo para converter um objeto Usuario (objeto instanciado a partir da classe ususario) em um mapa
  // String é o tipo da chave, e dynamic o valor da chave
  Map<String, dynamic> paraJson() {
    // retornando em formato de mapa, passando para os atributos criados, o valor das variavieis de instancia criadas acima
    return {
      'nome': nome,
      'idade': idade,
      'isEstudante': isEstudante,
      'telefones': telefones,
      'emails': emails,
    };
  }

  //metodo para criar um objeto usuario a partir de um mapa
  factory Usuario.deJson(Map<String, dynamic> json) {
    // retorna um novo objeto instanciado de usuário passando as informações recebidas do objeto chamado 'json' criando anteriormente
    return Usuario(
        nome: json['nome'],
        idade: json['idade'],
        isEstudante: json['isEstudante'],
        telefones: List<String>.from(json['telefones']),
        emails: List<String>.from(json['emails'])
        );
  }
}

void main(List<String> args) {
  //String json com um único usuário
  String jsonString = '{"nome":"Alice","idade":30,"isEstudante":false,"telefones":["1234-5678", "0987-6543"], "emails":["alic@gmail.com", "alices@gmail.com"]}';
  //COnverter a string json em um mapa
  Map<String, dynamic> usuarioJson = jsonDecode(jsonString);
  //Criar um objeto Usuario a partid do mapa
  Usuario usuario = Usuario.deJson(usuarioJson);
  //Exibir os detalhes do usuário
  print(
      '''Nome: ${usuario.nome}, Idade: ${usuario.idade}, Estudante: ${usuario.isEstudante}, Telefones: ${usuario.telefones.join(', ')}, Emails: ${usuario.emails.join(', ')}'''); // .join(', ') irá separar os elementos dentro do array por , 
  //Converter o objeto Usuario de volta para JSON =
  String jsonSaida = jsonEncode(usuario.paraJson());
  print(jsonSaida);
}
