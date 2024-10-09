void main() {
  // sixtase:
  // <tipo> nome = atribuição;
  // <tipo> nome;
  // nome = atribuição
  // fortamenete tipada

  String nome = 'Alunos que reclamam';

  int idade;
  idade = 10;

  double cotacaoDolar = 5.64;
  // para parar de dar nullo
  print(cotacaoDolar);

// interpoção de String
  print("Nome $nome - Idade $idade");

//Concatenação de strings
  print("Nome$nome - Idade $idade");

// Por ser fortemente não permite atribuir um valor que
// não perterce ao tipo da varável
// idade = "Numero nove";

/* Por ser fortemente tipado não permite atribuir uma valor que gera perda da previsão da informação */
// idade = 1.5;
  cotacaoDolar = 5;
  cotacaoDolar = 5.0;

// Nome da varável não usar aracteres especiais . espaços ou
// palavras reservadas
// https://dart.dev/language/keywords

// Palavra reservada var é utlizada em Dart para declaar uma variavel
// com o tipo inferido
  num idadeInferido;

  idadeInferido = 20;

  idadeInferido = 1.5;

  print("Idade ($idadeInferido)");

// aceita qualquer coisa

  dynamic tipoMae;
  tipoMae = 10;
  tipoMae = 'String';

/* Object é a classe base de todos o objetos
isso signifca que todos os tipos em Dart, Incluindo os tipos primitivos 
são do tipo
Object
*/

  // ignore: unused_local_variable
  Object tipoMaedasMaes;
  tipoMaedasMaes = 20;
  tipoMaedasMaes = 20.5;
  tipoMaedasMaes = "20.5";

// Evite tipos Object ou Dynamic , pois  poderá ocorrer um erro em tempo de execução
  tipoMae += 10;

  print("Valor da variável tipo $tipoMae");
}
