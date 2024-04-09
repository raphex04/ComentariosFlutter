// Importa o pacote do Flutter 
import 'package:flutter/material.dart';

// Classe MyApp que define o widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // Define o AppBar da tela
        appBar: AppBar(
          title: Text('Cadastro de produtos'), // Define o título da AppBar
          centerTitle: true, // Centraliza o título na AppBar
          backgroundColor: Colors.blueGrey, // Define a cor de fundo da AppBar
        ),

        body: Center(
          child: ElevatedButton(

              onPressed: () {
                Navigator.popUntil(
                    context,
                    ModalRoute.withName(
                        '/')); // Fecha todas as telas
              },
              child: Text('voltar') // Define o texto do botão
              ),
        ));
  }
}

// Classe CadastroProduto que define o widget para a tela de cadastro de produtos
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() =>
      _CadastroProdutoState(); // Cria o estado associado ao widget CadastroProduto
}

// Classe de estado _CadastroProdutoState que gerencia o estado do widget CadastroProduto
class _CadastroProdutoState extends State<CadastroProduto> {
  TextEditingController nomeController =
      TextEditingController(); // Controlador para o campo de nome do produto
  TextEditingController descricaoController =
      TextEditingController(); // Controlador para o campo de descrição do produto
  String _textInfo =
      "Informe seus dados";

  // Método para realizar o cadastro de produto
  void _cadastro() {
    setState(() {
      String nome =
          nomeController.text; // Obtém o valor do campo de nome do produto
      String descricao = descricaoController
          .text; // Obtém o valor do campo de descrição do produto
      if (nome.isEmpty || descricao.isEmpty) {

        _textInfo = "O campos estão vazios";
      } else {
        _textInfo =
            "Produto foi cadastrado com sucesso";
      }
    });
  }

  // Método para limpar os campos
  void _limpar_tela() {
    nomeController.text = ""; // Limpa o campo de nome do produto
    descricaoController.text = ""; // Limpa o campo de descrição do produto
    setState(() {
      _textInfo =
          "Informe os dados do produto";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o AppBar da tela
      appBar: AppBar(
        title: Text("Cadastro de produto"), // Define o título da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        actions: <Widget>[
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh))
        ],
      ),
      // Define o corpo da tela
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
            10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Alinha os elementos à esquerda
          children: <Widget>[
            const Icon(
              Icons.person, // Ícone de usuário
              size: 120.0,
              color: Colors.blue, // Cor do ícone
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome do produto",
                  labelStyle: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.center, // Alinha o texto ao centro.
              style: TextStyle(fontSize: 25.0), // Define o tamanho da fonte
              controller:
                  nomeController, // Define o controlador para o campo de nome do produto
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Descricao do produto",
                  labelStyle: TextStyle(color: Colors.blue)),

              textAlign: TextAlign.center,
              // Alinha o texto ao centro
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: descricaoController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro,
                  child: const Text("Cadastre-se"),
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
