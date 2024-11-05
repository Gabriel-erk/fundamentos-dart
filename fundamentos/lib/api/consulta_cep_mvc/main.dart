import 'endereco.dart';
import 'endereco_controller.dart';
import 'dart:io';

// Função para validar o CEP
String validaCEP(String? cep) {
  if (cep == null || cep.isEmpty) {
    throw Exception("CEP inválido. Tente novamente!");
  } else {
    // Remove todos os caracteres não numéricos
    cep = cep.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length != 8) {
      throw Exception("CEP inválido, deve possuir 8 números.");
    }
    return cep;
  }
}

void main(List<String> args) async {
  // Criando instância do EnderecoController
  final controller = EnderecoController();

  try {
    String? cepUsuario;

    // Solicita o CEP ao usuário até que ele insira um valor válido
    while (true) {
      print("Digite o CEP:");
      cepUsuario = stdin.readLineSync();
      if (cepUsuario != null && RegExp(r'^\d{8}$').hasMatch(cepUsuario)) {
        break;
      } else {
        print("CEP deve ser numérico e possuir 8 caracteres.");
      }
    }

    // Chamada assíncrona para buscar o endereço, com validação do CEP
    Endereco endereco = await controller.buscarEndereco(validaCEP(cepUsuario));

    // Exibindo as informações do endereço
    print("Logradouro: ${endereco.logradouro}");
    print("Bairro: ${endereco.bairro}");
    print("Cidade: ${endereco.localidade}");
    print("UF: ${endereco.uf}");
  } catch (e) {
    // Exibe o erro caso ocorra alguma exceção
    print("Erro: $e");
  }
}