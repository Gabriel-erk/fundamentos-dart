import 'tipoRemedio.dart';

class Remedio {
  String nome;
  double dosagem;
  TipoRemedio tipo;

  Remedio(this.nome, this.dosagem, this.tipo);

  String obterInformacoes(Remedio remedio) {
    return 'Remédio: $nome; Dosagem: $dosagem mg; Tipo: ${tipo.name}';
  }
}
