// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Importa os arquivos
import 'imc.dart';
import 'Contador.dart';
import 'CadastroUser.dart';
import 'CadastroProduto.dart';

// Classe Home que define o widget
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() =>
      _HomePageState(); // Cria o estado associado ao widget Home
}

// Classe de estado _HomePageState que gerencia o estado do widget Home
class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Define o AppBar da tela
      appBar: AppBar(
        title: Text("MENU"), // Define o título da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        // Define uma coluna para deixar na vertical
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Alinha os elementos à esquerda
          children: <Widget>[

            const Icon(
              Icons.add_business_sharp,
              size: 120.0,
              color: Colors.blue,
            ),

            Text(
              "Aplicação Principal",
              textAlign: TextAlign.center, // Deixa o texto no centro
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25.0), // Define o estilo do texto
            ),

            Text(
              "",
              textAlign: TextAlign.center, // Deixa o texto no centro
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25.0), // Define o estilo do texto
            ),
            // Botões para navegar para as telas do aplicativo
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Botão para navegar para a tela do IMC
                  ElevatedButton(
                      child: const Text("IMC"), // Define o texto do botão
                      onPressed: () {
                        // Define a ação ao botão
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Imc())); // Navega para a tela do IMC
                      }),
                  // Botão para navegar para a tela do contador
                  ElevatedButton(
                      child: const Text("Contador"), // Define o texto do botão
                      onPressed: () {
                        // Define a ação ao botão
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Cont())); // Navega para a tela do contador
                      }),
                  // Botão para navegar para a tela de cadastro de usuário
                  ElevatedButton(
                      child: const Text("Cadastro Usuario"),
                      // Define o texto do botão
                      onPressed: () {
                        // Define a ação ao botão.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroUser())); // Navega para a tela de cadastro de usuário
                      }),
                  // Botão para navegar para a tela de cadastro de produtos
                  ElevatedButton(
                      child: const Text("Cadastro de produtos"),
                      // Define o texto do botão
                      onPressed: () {
                        // Define a ação ao botão
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroProduto())); // Navega para a tela de cadastro de produtos
                      }),
                ]),
          ],
        ),
      ),
    );
  }
}