void main(List<String> args) {
  /*
  Null Safefy é uma caracteristica introdizada no DART a partida da 
  versão 2.12 que visa evitar erros em tempo de execução.
  O Null Safety torna o sistema de Tipagem Forte mais rigoroso 
  */

  // variaveis non-nullable
  String nomeCompletoSemAtribuicao;
  nomeCompletoSemAtribuicao = "Fundamentos do Dart";

  // String nomeCompletoComAtribuicao = null;
  // nomeCompletoComAtribuicao = "fundamentos do Dart";

  // variável nullable - ? = aceita null
  String? nomeCompletoCOmAtribuicaoNullable;

  // para parar de dar warning
  print(nomeCompletoCOmAtribuicaoNullable);
  print(nomeCompletoSemAtribuicao);
}
