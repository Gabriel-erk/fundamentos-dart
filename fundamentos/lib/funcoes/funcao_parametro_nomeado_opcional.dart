// função com parâemetros nomeados
// chave determina que o parametro é opcional e nomeado
import 'dart:io';

void exibirMensagem(
    {String nome = "Visitante", String mensagem = "Bem Vindo"}) {
  print("$mensagem, $nome.");
}

void exibirMensagemPosicional(
    [String? nome, String? mensagem = "Bem Vindo"]) {
  print("$mensagem, ${nome ??= "Visitante"}."); // ${nome ??= "Visitante"} diz que quando o nome for nullo, passa o valor visitante para a váriavel nome
}

void main(List<String> args) {
  print("Digite o nome do  Visitante");
  var visitante = stdin.readLineSync();

  print("Digite a mensagem");
  var mensagem = stdin.readLineSync();

  if (visitante != "" && mensagem != "") {
    // por conta das "{}" devo chamar o nome do parâmetro a passar a váriavel do meu escopo atual que quero passar a função
    exibirMensagem(mensagem: mensagem.toString(), nome: visitante.toString());
    exibirMensagemPosicional(visitante!, mensagem!);
  } else if (visitante == "" && mensagem == "") {
    exibirMensagem();
    exibirMensagemPosicional();
  } else if (visitante != "" && mensagem == "") {
    exibirMensagem(nome: visitante.toString());
    exibirMensagemPosicional(visitante!);
  } else if (visitante == "" && mensagem != "") {
    exibirMensagem(mensagem: mensagem.toString());
    exibirMensagemPosicional(null, mensagem);
  }
}
