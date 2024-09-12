void main(List<String> args) {
  List<int> listNumeros = [1, 2, 3];

  List<String> ListaTextos = ['Fulano', 'Beltrano', 'Sicrano'];

  var ListaTextosInferencia = [1, 2, 3];

//Declaração de lista vazia

  List<int> listasemDadosGenerico = [];

  var listasemDadosInferencia = [];

  var listasemDadosInferenciaGenerico = [];

  var listasemDadosInferenciaGenericoString = <String>[];

// imprimindo tudo de uma vez para remover warning
  print(
      '$listNumeros $ListaTextos $ListaTextosInferencia $listasemDadosGenerico $listasemDadosInferencia $listasemDadosInferenciaGenerico $listasemDadosInferenciaGenericoString');
}
