import 'package:cadastro_usuario/controller/UsuarioController.dart';
import 'package:cadastro_usuario/model/usuario.dart';

void main() async {
  final usuarioController = UsuarioController();

  Usuario usuario =
      Usuario(nome: "Jaybee", email: "mrJaybee@gmail.com", senha: "senha");
  await usuarioController.adicionarUsuario(usuario);
}
