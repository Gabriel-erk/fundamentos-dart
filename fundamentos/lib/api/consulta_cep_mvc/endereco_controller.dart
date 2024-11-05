// aqui representa o controller do MVC

import 'endereco.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EnderecoController {
  // pede o cep (String cep) e consulta o endereço ( <Endereco>) - future pode retornar algo no futuro, e só é usado quando se tem consulta de api em um méotodo...etc, e usando função asyncrona, ou seja, quando chegar em determinada linha, vai parar a aplicação e esperar carregar (mesmo que leve 30segundos ou mais, a aplicação para)
  Future<Endereco> buscarEndereco(String cep) async {
    // passando o cep como parâmetro da url para encontrar o cep passado (/$cep/)
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      Map<String, dynamic> cep = jsonDecode(resposta.body);
      return Endereco.deJson(cep);
    } else {
      throw Exception("Erro na busca do endereço: ");
    }
  }
}