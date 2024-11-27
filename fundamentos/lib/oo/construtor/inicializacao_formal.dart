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
        this.anoFabricacao,
        this.anoModelo,
        this.temABS);

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