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
    return "Fabricante: ${fabricante} \nmodelo: ${modelo}\nAno de Fabricação: ${anoFabricacao}\nAno do Modelo: ${anoModelo}\nTem ABS: ${temABS!?"SIM":"NÃO"}";
  }

  @override
  String toString() {    
    return retornaDados();
  }

}