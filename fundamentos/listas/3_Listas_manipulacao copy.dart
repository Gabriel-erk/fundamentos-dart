// ignore_for_file: file_names

void main(List<String> args) {
  final numeros = [1, 2, 3, 4];
  print(numeros);

  // adicionando o valor 5 no final do array
  numeros.add(5);
  print(numeros);

  // não permite reatribuir em uma variável final (que é basicamente uma constante)
  // numeros = [6, 7, 8, 9];

  final nomes = ['Fulano', 'Beltrano'];
  print(nomes);

  nomes.add("Siclano");
  print(nomes);

  // Acesso ao item da lista através do índice
  print("Primeiro Índice: ${nomes[0]}");
  print("Terceiro Índice: ${nomes[2]}");

  // Método insert - adiciona um item na posição determinada
  nomes.insert(0, "Novo Primeiro");
  nomes.insert(4, "Gabriel");
  print(nomes);

  // Método addAll - adiciona uma lista dentro de outra
  final nomes1 = ["Fulano1", "Beltrano 1"];
  nomes.addAll(nomes1);
  print(nomes);

  // Método insertAll - adiciona uma lista dentro de outra em um índice específico
  final nomes2 = ["Fulano2", "Beltrano2"];
  nomes.insertAll(3, nomes2);
  print(nomes);

  // Método remove - remove um item da lista
  nomes.remove('Fulano1');
  print(nomes);

  nomes.remove('Beltrano1');
  print(nomes);

  // Método removeWhere - remove itens que atendem a um critério com função lambda
  nomes.removeWhere((nome) => nome.substring(0, 6) != 'Fulano');
  print(nomes);  // Sobram apenas os nomes que começam com "Fulano"
}
