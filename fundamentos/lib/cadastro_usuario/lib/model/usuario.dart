class Usuario {
  int? id;
  String nome;
  String email;
  String senha;

  // obrigatórios possuem required
  Usuario(
      {this.id, required this.nome, required this.email, required this.senha});
  // converte um objeto Usuario para um mapa (formato que o sqlite entende)
  Map<String, dynamic> toMap() {
    return {
      // jogando os dados do objeto para um mapa
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  // usado para trazer informações do mapa para um objeto
  factory Usuario.fromMap(Map<String, dynamic> map){
    return Usuario(
       id: map['id'],  
       nome: map['nome'], 
       email: map['email'], 
       senha: map['senha'], 
      );
  }
}
