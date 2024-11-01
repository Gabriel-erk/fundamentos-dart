// ignore_for_file: file_names

void main(List<String> args) {
  // ? = nullable (aceita null)
  // sem nada (padrão) (não aceita valores null)

  // tem que inicializar a lista e os itens internos não podem ser nulos
  List<String> nome = [];

  // não precisa inicializar a lista por conta do '?' (pode conter valores nulos) - e os itens internos não podem ser nulos
  List<String>? nomesNulos;
  // nomesNulos = ["Fulano", null]; - vai gerar um erro, pois não permite valores nulos

  // tem que inicializar a lista e os itens internos podem ser nulos
  List<String?> nomesInternosAceitaNulos = ["Fulano", null];

  // nao precisa inicializar a lista e os itens internos podem ser nulos
  List<String?>? nomesNulosInternosAceitaNulos;

  /*---------------- Declaração por inferência ----------------*/
  // declarando que só vai aceitar objetos do tipo String (uma lista de objetos do tipo string, que não aceita valores nulos)
  // tem que inicializar a lista e os itens internos não podem ser nulos
  var nomeInferencia = <String>[];

  // Tem que inicializar a lista e os itens internos podem ser nulos
  final nomesInternosAceitaNulosInferencia = <String?>["Fulano", null];

  // Não precisa inicializar a lista e os itens internos podem ser nulos
  // Não é possivel declarar por inferência
  // var nomesNulosInternosAceitaNulosInferencia = <String?>?null;

  // imprimindo pra tirar warning
  print('$nome $nomesNulos $nomesInternosAceitaNulos $nomesNulosInternosAceitaNulos $nomeInferencia $nomesInternosAceitaNulosInferencia');
}
