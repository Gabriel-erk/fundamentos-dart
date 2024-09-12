// ignore_for_file: file_names

void main(List<String> args) {
  final numeros = [1, 2, 3, 4];
  print(numeros);

  // adicionando o valor 5 no final do array
  numeros.add(5);
  print(numeros);

  // não permite reatribuir em uma váriavel final (q é basicamente uma constante)
  // numeros = [6, 7, 8, 9];

  // sabe q é uma lista de strings pois todo o conteúdo possui caracteres
  final nomes = ['Fulano', 'Beltrano'];
  print(nomes);

  nomes.add("Siclano");
  print(nomes);

  // acesso ao item da lista através do indice - inicializa com o indice 0
  print("Primeiro Indice");
  print(nomes[0]);
  print("Terceiro Indice");
  print(nomes[2]);

  // percorrendo lista com forEach
  // for (var nome in nomes) {
  //   print(nome);
  // }

  /*------------- método insert de List - adiciona um item na posição determinada */

  // adiciona na posição q quiser - adiciona na posição 0 e passa o resto p frente
  nomes.insert(0, "Novo Primeiro");
  nomes.insert(4, "Gabriel");
  print(nomes);

  /*------------- método addAll - adiciona uma lista dentro de outro */
  final nomes1 = ["Fulano1", "Beltrano 1"];
  // adicionando dentro de nomes todos os itens de 'nomes1'
  nomes.addAll(nomes1);
  print(nomes);

  /*------------- método insertAll - adiciona uma lista dentro de outro */
  final nomes2 = ["Fulano2", "Beltrano2"];
  // adicionando todos os itens de nomes2 dentro de nomes, a partir do indice 3
  nomes.insertAll(3, nomes2);
  print(nomes);

  /*------------- método remove - excluir um item da lista */
  // utiliza o operador igual ==
  // remove o valor igual a Fulano 1
  nomes.remove('Fulano1');
  print(nomes);

  nomes.remove('Beltrano1');
  print(nomes);

  /*------------- método removeWhere - remove um item que atende um critério */
  // colocando uma função anônima dentro da função removeWhere
  // removeWhere é um método existente nas listas
  // nomes.removeWhere((nome) {
  //   print('Nome procurado: $nome');
  //   // se o nome não começar com 'Ful' pode remover (! para mostrar negação - então, para retornar true, o nome não pode começar com ful, caso não começe com ful, o if retorna true (ou seja, se não começa com ful, pode remover))
  //   // if (!nome.startsWith('Ful'))
  //   // pega os primeiros 6 caracters, e se for diferente de fulano, remove
  //   if (nome.substring(0, 6) != 'Fulano') {
  //     print('Nome removido nesta iteração: ${nome.substring(0,6)}');
  //     // retorna true, ou seja, true para remover o que for diferente de fulano
  //     return true;
  //   } else {
  //     print('Nome mantido nesta iteração: $nome');
  //     // se não retorna false, ou seja, para não executar a função naquele elemento, ou seja, nos elementos que são iguais a fulano, não irá remove-los
  //     return false;
  //   }
  // });

  // mesmo código acima, porém com função lambda (nome) = função anônima e o resto é o seu corpo
  nomes.removeWhere((nome) => nome.substring(0, 6) != 'Fulano');
  print(nomes);
  // so sobra fulano
  print(nomes);
}
