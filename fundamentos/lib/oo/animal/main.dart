import 'package:fundamentos/oo/animal/Gato.dart';

import 'alimento.dart';

void main(List<String> args) {
  var racaoGato = Alimento("ração de peixe");

  var gato = Gato("Garfield", 999.99, 0, racaoGato);
  gato.fazerSom();
}
