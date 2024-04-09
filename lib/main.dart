import 'package:flutter/material.dart'; // Importa o pacote do Flutter

// Importa os arquivos
import 'home.dart';
import 'imc.dart';
import 'contador.dart';
import 'CadastroUser.dart';
import 'CadastroProduto.dart';

void main() {
  runApp(const MyApp()); // Executa o Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Define a classe MyApp como um widget

  // Este é o widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // Define a tela inicial do aplicativo como Home
    );
  }
}
