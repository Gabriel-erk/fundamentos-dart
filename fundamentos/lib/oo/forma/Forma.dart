import 'enum.dart';

abstract class Forma {
  TpForma tipoForma;
  // atributo static faz com que tenha o mesmo valor em todo o sistema
  static int idFormaClasse = 0;
  int idFormaInstancia = 0;

  Forma(this.tipoForma);

  double calculaArea();

  void imprimeForma() {
    print("${tipoForma.name} com área de ${calculaArea()} <-> ID da Forma: Classe ${idFormaClasse} Instância ${idFormaInstancia} ");
  }
}
