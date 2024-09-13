void main(List<String> args) {
  final nome = "fulano de tal";

  // pega do caracter 8 em diante (posição 8 em diante)
  var nomeSubstring = nome.substring(8);
  print(nomeSubstring);

  // vai do caracter 0 até o 7 (da posição 0 até a 7)
  nomeSubstring = nome.substring(0, 7);
  print(nomeSubstring);

  var sexo = "MASCULINO";

  var SexoSigla = sexo.substring(0, 1);
  if (SexoSigla == 'M') {
    print('Sexo Masculino');
  }
  if (sexo.startsWith('M')) {
    print('Sexo Masculino');
  }

  // Faça funcionar com o m minusculo
  if (sexo.startsWith('m')) {
    print('Sexo Masculino');
  }

// Faça funcionar com o m minusculo
  if (sexo.toLowerCase().startsWith("m")) {
    print("Sexo Masculino");
  }

  if (nome.toUpperCase().contains('tal')) {
    print('E da familia TAL');
  }

  // Concatenção do string
  final primeiroNome = 'Fulano';
  final segundoNome = 'Do tal';

  final saudacaoConcatenacao =
      // usando interpolação corretamente
      'Olá $primeiroNome $segundoNome Seja bem vindo';
  // 'Olá' + primeiroNome + ' ' + segundoNome + ' Seja bem vindo';
  print(saudacaoConcatenacao);

  final saudacaoInterpolocao = 'Olá $primeiroNome $segundoNome seja bem vindo';
  print(saudacaoInterpolocao);

  final saudacaoInterpolocaofuncao = 'Olá ${primeiroNome.toUpperCase()} '
      ' ${segundoNome.toUpperCase()} Seja bem vindo ';
  // exemplo em aula
  // final saudacaoInterpolocaofuncao = 'Olá ${primeiroNome.toUpperCase()} ' +
  //     ' ${segundoNome.toUpperCase()} Seja bem vindo ';

  print(saudacaoInterpolocaofuncao);

  var paciente = 'Fulano Do TAL|30 anos | Brasileiro';

  final dadosPacientes = paciente.split('|');
  print('Nome: ${dadosPacientes[0]} Idade: ${dadosPacientes[1]} '
      '  Nacionalidade: ${dadosPacientes[2]}');

  paciente = 'Beltrano Santos|25 anos|Holandes ';
  dadosPacientes.addAll(paciente.split('|'));
  print('Nome ${dadosPacientes[3]}  Idade: ${dadosPacientes[4]}'
      ' Nacionalidade: ${dadosPacientes[5]}');

  // Lista de Lista
  final listaPacienciaLista = [
    ['Fulano de TAL', '30 Anos', 'Brasileiro'],
    ['Beltrano Santos', '25 Anos', 'Horlandes']
  ];

  paciente = 'Sicrano de Silva|19 Anos|Alemanha';
  listaPacienciaLista.add(paciente.split('|'));
  for (var dadosPacientes in listaPacienciaLista) {
    print('Nome ${dadosPacientes[0]} Idade:${dadosPacientes[1]}  '
        'Nacionalidade ${dadosPacientes[2]}');

    print('Primeira Registro');
    print('Nome: ${listaPacienciaLista[0][0]} Idade: ${listaPacienciaLista[1][1]} Nacionalidade ${listaPacienciaLista[1][2]}');
    // print('Nome: ${listaPacienciaLista[0][0]} ' +
    //     'Idade: ${listaPacienciaLista[1][1]} ' +
    //     'Nacionalidade ${listaPacienciaLista[1][2]}');

    print('Nome: ${listaPacienciaLista[1][0]} Idade: ${listaPacienciaLista[1][1]} Nacionalidade ${listaPacienciaLista[1][2]}');
  }
}
