import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cadastro_usuario_flutter/view/usuario_view.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // se fir windows ou linux, inicia manualmente o sqlite, pois nessas plataformas ele não está iniciado automaticamente (diferente do celular q é ativo por padrão) chamando o comando do pacote sqfilteffinit
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que o Flutter inicie corretamente
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuários',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UsuarioView(),
    );
  }
}
