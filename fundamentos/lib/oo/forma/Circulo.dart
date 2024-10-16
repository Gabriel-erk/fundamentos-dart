import 'Forma.dart';
import 'enum.dart';

class Circulo extends Forma {
  double raio = 0;

  Circulo(this.raio) : super(TpForma.Circulo);

  @override
  double calculaArea() {
    return 3.14159 * raio * raio; // Elevando o raio ao quadrado
  }
}
