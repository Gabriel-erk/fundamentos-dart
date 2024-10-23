import 'animal.dart';

// relacionamento de associação entre animal e veterininário (ambos não dependem um do outro para serem instanciados, posso ter uma instância de animal, e uma de veterinário, sem que estejam necessariamente ligados)
class Veterinario {
  String nome;

  Veterinario(this.nome);

  void atender(Animal animal) {
    print('$nome está atendendo o animal ${animal.nome}');
  }
}
