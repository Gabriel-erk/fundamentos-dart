class Carro {
  String? fabricante;
  String? modelo;
  int? anoFabricacao;
  int? anoModelo;
  bool? temABS;  
  
  // Construtor com parâmetros 
  Carro(String fabricante,  
        String modelo,
        int anoFabricacao,
        int anoModelo,
        bool temABS){
    this.fabricante = fabricante;      
    this.modelo = modelo;
    this.anoFabricacao = anoFabricacao;
    this.anoModelo = anoModelo;
    this.temABS = temABS;  
  }


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