class Carro {
  String? fabricante;
  String? modelo;
  int? anoFabricacao;
  int? anoModelo;
  bool? temABS;
  // Construtor padrão, pode ser ocultado
  // Carro():super(){}
  void imprimeDados(){
    print(retornaDados());
  }  

  String retornaDados(){
    return "Fabricante: $fabricante \nmodelo: $modelo\nAno de Fabricação: $anoFabricacao\nAno do Modelo: $anoModelo\nTem ABS: ${temABS!?"SIM":"NÃO"}";
  }

  @override
  String toString() {    
    return retornaDados();
  }

}