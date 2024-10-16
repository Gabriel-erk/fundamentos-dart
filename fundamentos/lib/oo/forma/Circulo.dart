import 'dart:math';

import 'Forma.dart';
import 'enum.dart';

class Circulo extends Forma {
  double raio = 0;

  Circulo(this.raio) : super(TpForma.Circulo);

  @override
  double calculaArea() {
    return pi * raio * raio; // Elevando o raio ao quadrado
  }
}
