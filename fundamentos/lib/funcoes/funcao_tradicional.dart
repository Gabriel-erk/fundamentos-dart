import 'dart:io';
 
int somar(int a, int b) {
  return a + b;
}
 
void main(List<String> args) {
  print('informe o 1° número');
  var numero1 = stdin.readLineSync();
 
  print('informe o 2° número');
  var numero2 = stdin.readLineSync();
 
  try {
    var resultado = somar(int.parse(numero1!), int.parse(numero2!));
    print('O resultado e ${numero1} + ${numero2} = ${resultado}');
  } catch (e) {
    print('Numero 1 ou 2 invalido');
  }
}