void main(List<String> args) {
  print('\n// List permite valores duplicados');
  List<int?> numerosList =
      []; // Lista que permite valores duplicados e valores nulos
  numerosList.add(1);
  numerosList.add(1);
  numerosList.add(2);
  numerosList.add(2);
  numerosList.add(3);
  numerosList.add(4);
  numerosList.add(null);
  numerosList.add(5);
  print(numerosList);

  print('\n// Set NÃO permite valores duplicados');
  Set<int?> numeroSet = {}; // Set que não permite valores duplicados
  numeroSet.add(1);
  numeroSet.add(1); // Ignorado por já existir no Set
  numeroSet.add(2);
  numeroSet.add(2); // Ignorado por já existir no Set
  numeroSet.add(3);
  numeroSet.add(4);
  numeroSet.add(null); // Permite valor nulo uma vez
  numeroSet.add(5);
  print(numeroSet); // Imprime apenas valores únicos

  print('\n// metodo List.toSet() para transformar uma lista em um set');
  var numerosSetDeList = numerosList
      .toSet(); // transforma a lista em set, set é uma lista que n permite numeros iguais

  print('\n// Set também possui os metodos interable');
  numerosSetDeList.forEach(print);

  print(
      '''\n// metodo difference de Set compara dois Sets e apresenta apenas os itens que exclusivos do primeiro conjunto''');
  var conjuntosNumeros1 = {1, 2, 3, 4, 5, 6};
  var conjuntosNumeros2 = {1, 2, 3, 7};
  print('conjunto 1: $conjuntosNumeros1');
  print('conjunto 1: $conjuntosNumeros2');

  print(
      '''\n// metodo difference de Set compara dois Sets e apresenta apenas os itens que exclusivos do primeiro conjunto''');
  print('''\n// itens exclusivos do conjunto 1 em relação ao conjunto 2''');
  print(conjuntosNumeros1.difference(conjuntosNumeros2));

  print('''\n// itens exclusivos do conjunto 2 em relação ao conjunto 1''');
  print(conjuntosNumeros2.difference(conjuntosNumeros1));

  print('\n// método union - junta dois sets');
  print(conjuntosNumeros1.union(conjuntosNumeros2));

  print(
      '\n// método intersection - retorna apenas os itens existentes nos dois conjuntos');
  print(conjuntosNumeros1.intersection(conjuntosNumeros2));

  var conjuntoNomes1 = {'Fulano', 'Beltrano', 'Siclano'};
  var conjuntoNomes2 = {'Fulano', 'Beltrano'};
  print('//Conjunto de nomes 1: $conjuntoNomes1');
  print('//Conjunto de nomes 2: $conjuntoNomes2');
  print(
      'Interseção dos dois conjuntos ${conjuntoNomes1.intersection(conjuntoNomes2)}');

  print(
      '''\n// metodo lookup - pesquisa um item dentro do conjunto, se não encontrar retorna null''');
  print(conjuntoNomes2.lookup('Beltrano'));
  print(conjuntoNomes2.lookup('Siclano'));
  print(
      '''\n// para retornar um item do conjunto atraves do indice, deve-se utilizar o método elementAt(index)''');
  print('Segundo nome do conjunto: ${conjuntoNomes1.elementAt(1)}');
}
