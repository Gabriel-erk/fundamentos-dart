import 'Forma.dart';
import 'enum.dart';

class Triangulo extends Forma {
  double lado = 0;
  double altura = 0;

  Triangulo(this.lado, this.altura) : super(TpForma.Triangulo);

  @override
  double calculaArea() {
    return (lado * altura) / 2;
  }
}
