import 'dart:convert';

void main(List<String> args) {
  // criar um mapa (objeto) - dynamic vai pegar de forma "dinamica"
  Map<String, dynamic> usuario = {
    'nome': 'Alice',
    'idade': 10,
    'esstudante': false,
  };

  // Converter o mapa (usuario) em json 
  // jsonEncode é um método importado daa biblioteca dart:convert
  String jsonString = jsonEncode(usuario);
  print(jsonString);
}
