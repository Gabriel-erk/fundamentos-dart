import 'dart:io';

void main(List<String> args) {
  const limiteIdade = 16;

  print("Informa a sua idade");
  final idade = stdin.readLineSync();
  /*
  = -> Atribuição
  == -> comparação
  < -> menor que 
  > => maior que
  <= -> menor ou igual a


  */

  if (idade != null) {
    final idadeConvertido = int.tryParse(idade);

    //   if (idadeConvertido != null && idadeConvertido < limiteIdade) {
    //     print("não pode votar");
    //   } else if (idadeConvertido == limiteIdade) {
    //     print("Primeiro ano de votação");
    //   } else {
    //     print("Pode Votar");
    //   }
    // }

// Test logigo valor se verdadeiro:valor se falso;
    final podeVotar =
        (idadeConvertido != null) ? idadeConvertido >= limiteIdade : false;

    if (podeVotar) {
      print("Pode votar");
    } else {
      print("Não pode votar");
    }
  }// fim do if (idade != null)
}
