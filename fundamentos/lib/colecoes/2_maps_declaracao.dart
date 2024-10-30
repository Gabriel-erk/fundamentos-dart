void main(List<String> args) {
  print('O literal de um Map é igual ao Set, utilizando as chaves {}');
  print('Para diferenciar utilizamos os generics na declaração');
  print('- Um para definir a chave');
  print('- Outro para definir o valor\n');

  // Map com inferência explícita de tipos
  final mapaDePacientes = <String, String>{
    'nome': 'Fulano de Tal',
    'funcao': 'Desenvolvedor',
  };

  // Mapas com permissões diferentes de nulos
  Map<String, String> mapaDePacientesNaoPermiteNulos = {};
  // Map<String, String> mapaDePacientesPermiteNulos = null;
  Map<String?, String> mapaDePacientesPermiteChavesNulos = {
    null: 'Fulano de Tal',
  };
  Map<String, String?> mapaDePacientesPermiteValoresNulos = {
    'nome': null,
    'funcao': null,
  };

  print('// Declaração por inferência');
  var mapaDePacientesNaoPermiteNulosInferencia = <String, String>{};
  var mapaDePacientesPermiteChavesNulosInferencia = <String?, String>{
    null: 'Fulano de Tal',
  };
  var mapaDePacientesPermiteValoresNulosInferencia = <String, String?>{
    'nome': null,
    'funcao': null,
  };

  print(
      '\n// Declaração de um mapa com uma lista aninhada, semelhante a uma estrutura JSON');
  var mapaAninhado = <String, Object>{
    'nome': "Escola de Dart",
    'cursos': [
      {
        'nome': 'Dart',
        'descricao': 'Fundamentos da linguagem Dart',
      },
      {'nome': 'Flutter', 'descricao': 'Fundamentos do framework Flutter'}
    ]
  };

  // imprimindo o mapa de forma legível
  // print(mapaAninhado);

  // Imprime "Escola de Dart", o curso "Dart" e o curso "Flutter"
  print('Escola: ${mapaAninhado['nome']}');
  print('Cursos');

  for (var curso in mapaAninhado['cursos'] as List) {
    print('- ${curso['nome']}: ${curso['descricao']}');
  }
}
