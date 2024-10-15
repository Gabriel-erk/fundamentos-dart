void main() {
  try {
    int resultado = divideNumero(20, 10);
    print("Resultado da Divisão $resultado");
  } /*on UnsupportedError {
    print("O divisor deve ser diferente de zero");
  } on NoSuchMethodError {
    print("O dividendo e o divisor devem ser números");
  } */
  catch (e) {
    print("Erro $e");
  } finally {
    print("Fim do Sistema");
  }
}

int divideNumero(dividendo, divisor) {
  if (dividendo is! int) {
    throw Exception("O dividendo e o divisor de ver um numero inteiro");
  } else if (divisor is! int) {
    throw Exception("O divisor deve ser um numero inteiro");
  } else if (divisor == 0) {
    throw Exception("O divisor deve ser diferente de zero");
  } else {
    return dividendo ~/ divisor;
  }
}