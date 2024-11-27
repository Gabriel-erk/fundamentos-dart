class Carro {
  // posso retirar o sinal ? (nullable)
  String fabricante;
  String modelo;
  int anoFabricacao;
  int anoModelo;
  bool temABS;  
  
  // Construtor com inicialização formal
  Carro(this.fabricante,  
        this.modelo,
        {this.anoFabricacao = 2012,
        this.anoModelo = 2011,
        this.temABS = true});

  void imprimeDados(){
    print(retornaDados());
  }  

  String retornaDados(){
    return "Fabricante: $fabricante \nmodelo: $modelo\nAno de Fabricação: $anoFabricacao\nAno do Modelo: $anoModelo\nTem ABS: ${temABS?"SIM":"NÃO"}";
  }

  @override
  String toString() {    
    return retornaDados();
  }

}