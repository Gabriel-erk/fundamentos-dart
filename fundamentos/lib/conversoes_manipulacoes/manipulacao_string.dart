void main(List<String> args) {
  final nome = "fulano de tal";

  // pega do caracter 8 em diante (posição 8 em diante)
  var nome_substring = nome.substring(8);
  print(nome_substring);

  // vai do caracter 0 até o 7 (da posição 0 até a 7)
  nome_substring = nome.substring(0, 7);
  print(nome_substring);
}
