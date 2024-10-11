// função para dizer olá
// colchetes permite declara um argumento opcional posicional - se não passar o segundo parâmetro ele recebe "ola"
import 'dart:io';

String dizerOla(String nome, [String saudacao = "Olá"]) {
  return '$saudacao, $nome';
}

// se saudacao não tiver um valor, terá o valo nullo
String dizerOlaArgumentoOpcionalNulo(String nome, [String? saudacao]) {
  saudacao ??= 'Olá';

  return '$saudacao, $nome.';
}

void main(List<String> args) {
  var nome;
  do {
    print("informe o nome:");
    nome = stdin.readLineSync();
  } while (nome == null);

  print("informe a saudação:");
  var saudacao = stdin.readLineSync();

  if (saudacao == null || saudacao == "") {
    print(dizerOla(nome));
  } else {
    print(dizerOla(nome, saudacao));
  }
}
