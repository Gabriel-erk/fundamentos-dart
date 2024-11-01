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
    return "Fabricante: ${this.fabricante} \nmodelo: ${this.modelo}\nAno de Fabricação: ${this.anoFabricacao}\nAno do Modelo: ${this.anoModelo}\nTem ABS: ${this.temABS!?"SIM":"NÃO"}";
  }

  @override
  String toString() {    
    return retornaDados();
  }

}