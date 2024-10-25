import 'alimento.dart';
import 'especie.dart';

// Generalização

abstract class Animal {
  String nome;
  double peso;
  Alimento alimento;
  Especie especie;

  // construtor da classe - possui o mesmo nome da classe
  Animal(this.nome, this.peso, this.alimento, this.especie);

  // é abstrato pois não sabe como agir, ou seja, não tem corpo
  void fazerSom();

  // é um metodo concreto
  void comer() {
    print('$nome comeu! - ${alimento.tipo}');
  }
}
