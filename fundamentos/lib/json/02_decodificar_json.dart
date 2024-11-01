import 'dart:convert';

void main(List<String> args) {
  // Strin json
  String jsonString = '{"nome": "Alice","idade":30,"isEstudante":false}';

  // Converter a string json em um mapa
  // método jsonDecode vem da biblioteca importada - e o argumento que ele pede é o json (estou passando uma string com o formato de um json, em pares chave/valor)
  Map<String, dynamic> usuario = jsonDecode(jsonString);

  print('Nome: ${usuario['nome']}'); // Alice
  print('Idade: ${usuario['idade']}'); // 30
  print('Estudante: ${usuario['isEstudante']?"Sim":"Não"}'); 
}
