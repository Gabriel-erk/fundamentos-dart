import 'alimento.dart';

// Generalização

abstract class Animal {
  String nome;
  double peso;
  Alimento alimento;

  // construtor da classe - possui o mesmo nome da classe
  Animal(this.nome, this.peso, this.alimento);

  // é abstrato pois não sabe como agir, ou seja, não tem corpo
  void fazerSom();

  // é um metodo concreto
  void comer() {
    print('$nome comeu! - ${alimento.tipo}');
  }
}
