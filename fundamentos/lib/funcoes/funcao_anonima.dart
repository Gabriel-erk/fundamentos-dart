// ignore_for_file: prefer_function_declarations_over_variables, avoid_function_literals_in_foreach_calls

void main(List<String> args) {
  // Função anônima armazenada em uma variável
  var somarAnonimo = (int a, int b) {
    return a + b;
  };

  print("Chamando função anônima ${somarAnonimo(10, 5)}");
  // Função nomeada declarada antes de ser utilizada
  print("Chamando uma função nomeada ${somarNomeado(30, 5)}");
  List<String> pessoas = ["Fulano|Gerente", "Beltrano|Vendedor"];
  pessoas.forEach(print);

  // var imprimePessoa = (String pessoa) {
  //   var dados = pessoa.split("|");
  //   print("Nome: ${dados[0]} Profissão: ${dados[1]}");
  // };
  // pessoas.forEach(imprimePessoa);

  pessoas.forEach((String pessoa) {
    var dados = pessoa.split("|");
    print("Nome: ${dados[0]} Profissão: ${dados[1]}");
  });

  for (var pessoa in pessoas) {
    var dados = pessoa.split("|");
    print("Nome: ${dados[0]} Profissão: ${dados[1]}");
  }
}

int somarNomeado(int a, int b) {
  return a + b;
}
