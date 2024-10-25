import 'package:fundamentos/oo/animal/especie.dart';

import 'animal.dart';
import 'alimento.dart';

// generalização
// relacionamento entre cachorro e animal
class Gato extends Animal {
  int ronrom;
  Gato(String nome, double peso, this.ronrom, Alimento alimento)
      // super está relacionado com o construtor da classe pai, onde tenho qu e passar esses 3 valores para instanciar meu "gato" - essas váriaveis "nome, peso, alimento" são as que são passadas para o construtor do meu gato
      : super(
            nome,
            peso,
            alimento,
            Especie
                .MAMIFERO); // dizendo que a especie do animal é mamifero, passando para o construtor da classe animal
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
    return 'Gato | Nome: $nome; Peso: $peso; Ronrom: $ronrom; Espécie: ${especie.name}'; // passa exatamente o name da especie que passei para o construtor da classe pai, no caso, mamifero, passei essse para o construtor, então tenho acesso a uma váriavel espécie, com seus atributos baseados no que passei para o construtor da classe, no caso, mamifero
  }
}
