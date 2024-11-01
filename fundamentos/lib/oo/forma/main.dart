import 'package:fundamentos/oo/forma/Quadrado.dart';
import 'package:fundamentos/oo/forma/Retangulo.dart';
import 'package:fundamentos/oo/forma/Circulo.dart';
import 'package:fundamentos/oo/forma/Triangulo.dart';
import 'Forma.dart';

void main(List<String> args) {
  List<Forma> formas = [];
  formas.add(Quadrado(10));
  formas.add(Retangulo(10,20));
  formas.add(Circulo(10));
  formas.add(Triangulo(10,30));

  for (var forma in formas) {
    forma.imprimeForma();
  }
}
