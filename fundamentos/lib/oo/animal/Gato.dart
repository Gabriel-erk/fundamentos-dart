import 'animal.dart';
import 'alimento.dart';
// generalização
// relacionamento entre cachorro e animal
class Gato extends Animal {
  int ronrom;
  Gato(String nome, double peso, this.ronrom, Alimento alimento)
  // super está relacionado com o construtor da classe pai, onde tenho qu e passar esses 3 valores para instanciar meu "gato" - essas váriaveis "nome, peso, alimento" são as que são passadas para o construtor do meu gato
      : super(nome, peso, alimento);
  void fazerCarinho() {
    ronrom += 10;
    print('$nome está ronronando $ronrom vezes mais');
  }

  @override
  void fazerSom() {
    print('$nome fez miau');
  }

  @override
  String toString() {
    return 'Gato | Nome: $nome; Peso: $peso; Ronrom: $ronrom';
  }
}
