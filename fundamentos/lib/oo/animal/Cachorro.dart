import 'package:fundamentos/oo/animal/especie.dart';

import 'animal.dart';
import 'alimento.dart';
import 'brinquedo.dart';
// generalização
// relacionamento entre cachorro e animal

class Cachorro extends Animal {
  int fofura;
  // caso apague brinquedo, o cachorro continua
  List<Brinquedo> brinquedos;
  Cachorro(String nome, double peso, this.fofura, Alimento alimento)
      : brinquedos =
            [], // inicializando brinquedo, começando com a lista em branco
        super(nome, peso, alimento, Especie.MAMIFERO);
  // adiciona o brinquedo passado como parâmetro na lista dde brinquedos
  void incluirBrinquedo(Brinquedo brinquedo) {
    brinquedos.add(brinquedo);
  }

  void brincar(Brinquedo brinquedo) {
    if (brinquedos.contains(brinquedo)) {
      fofura += 10;
      print('A fofura de $nome aumentou $fofura');
      print('$nome esta brincando com o brinquedo: ${brinquedo.nome}');
    } else {
      print('o brinquedo ${brinquedo.nome} não pertence ao $nome');
    }
  }

  @override // obrigatório
  void fazerSom() {
    print('$nome fez auau');
  }

  @override
  String toString() {
    return 'Cachorro | Nome: $nome; Peso: $peso; Fofura: $fofura; Espécie: ${especie.name}';
  }
}
