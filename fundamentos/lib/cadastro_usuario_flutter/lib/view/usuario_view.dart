import 'package:flutter/material.dart';
import 'package:cadastro_usuario_flutter/controller/usuario_controller.dart';
import 'package:cadastro_usuario_flutter/model/usuario.dart';

class UsuarioView extends StatefulWidget {
  @override
  _UsuarioViewState createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _usuarioController = UsuarioController();

  List<Usuario> _usuarios = [];
  String _erroMensagem = ''; // Variável para mensagens de erro

  @override
  void initState() {
    super.initState();
    _carregarUsuarios();
  }

  // Função para carregar os usuários e capturar erros
  _carregarUsuarios() async {
    try {
      List<Usuario> usuarios = await _usuarioController.obterUsuarios();
      setState(() {
        _usuarios = usuarios;
        _erroMensagem = ''; // Limpa a mensagem de erro
      });
    } catch (e) {
      setState(() {
        _erroMensagem = 'Erro ao carregar usuários: $e'; // Exibe o erro
      });
      print('Erro ao carregar usuários: $e'); // Exibe o erro no console
    }
  }

  _adicionarOuAtualizarUsuario({Usuario? usuario}) async {
    if (usuario != null) {
      _nomeController.text = usuario.nome;
      _emailController.text = usuario.email;
      _senhaController.text = usuario.senha;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(usuario == null ? 'Cadastrar Usuário' : 'Atualizar Usuário'),
          content: Column(
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (usuario == null) {
                  _adicionarUsuario();
                } else {
                  _atualizarUsuario(usuario);
                }
                Navigator.of(context).pop();
              },
              child: Text(usuario == null ? 'Cadastrar' : 'Atualizar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  _adicionarUsuario() async {
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _senhaController.text.isNotEmpty) {
      Usuario usuario = Usuario(
        nome: _nomeController.text,
        email: _emailController.text,
        senha: _senhaController.text,
      );
      await _usuarioController.adicionarUsuario(usuario);
      _nomeController.clear();
      _emailController.clear();
      _senhaController.clear();
      _carregarUsuarios();
    }
  }

  _atualizarUsuario(Usuario usuario) async {
    Usuario usuarioAtualizado = Usuario(
      id: usuario.id,
      nome: _nomeController.text,
      email: _emailController.text,
      senha: _senhaController.text,
    );
    await _usuarioController.atualizarUsuario(usuarioAtualizado);
    _nomeController.clear();
    _emailController.clear();
    _senhaController.clear();
    _carregarUsuarios();
  }

  _deletarUsuario(Usuario usuario) async {
    await _usuarioController.deletarUsuario(usuario);
    _carregarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuários'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _carregarUsuarios,
          ),
        ],
      ),
      body: _erroMensagem.isNotEmpty // Se houver erro, mostra a mensagem
          ? Center(child: Text(_erroMensagem, style: TextStyle(color: Colors.red)))
          : ListView.builder(
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final usuario = _usuarios[index];
                return ListTile(
                  title: Text(usuario.nome),
                  subtitle: Text(usuario.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _adicionarOuAtualizarUsuario(usuario: usuario),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletarUsuario(usuario),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarOuAtualizarUsuario(),
        child: Icon(Icons.add),
      ),
    );
  }
}