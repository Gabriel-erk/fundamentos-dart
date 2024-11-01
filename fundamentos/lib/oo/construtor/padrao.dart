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
    return "Fabricante: ${this.fabricante} \nmodelo: ${this.modelo}\nAno de Fabricação: ${this.anoFabricacao}\nAno do Modelo: ${this.anoModelo}\nTem ABS: ${this.temABS!?"SIM":"NÃO"}";
  }

  @override
  String toString() {    
    return retornaDados();
  }

}