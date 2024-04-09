// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Importa o arquivo de CadastroProduto.dart.

// Função principal do Flutter
void main() {
  // Executa oFlutter
  runApp(const MyApp());
}

// Classe MyApp que define o widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o AppBar da tela
        appBar: AppBar(
          title: const Text('Tela imc'), // Define o título da AppBar
          centerTitle: true, // Centraliza o título na AppBar
          backgroundColor: Colors.amber, // Define a cor de fundo da AppBar
        ),

        body: Center(
          child: ElevatedButton(
            // Cria um botão elevado que leva para a tela de cadastro de usuários quando pressionado
              child: const Text('Leva pra tela de cadastro dos usuarios'), // Define o texto do botão
              onPressed: (){
                // Define a ação a ser executada quando o botão for pressionado
                Navigator.pushNamed(
                    context,
                    '/CadastroUser' // Navega para a tela de cadastro de usuários
                );
              }
          ),
        )
    );
  }
}

// Classe CadastroUser que define o widget para a tela de cadastro de usuário
class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState(); // Cria o estado associado ao widget CadastroUser
}

// Classe de estado _CadastroUserState que gerencia o estado do widget CadastroUser
class _CadastroUserState extends State<CadastroUser> {
  TextEditingController usuarioController =TextEditingController(); // Controlador para o campo de usuário
  TextEditingController senhaController = TextEditingController(); // Controlador para o campo de senha
  String _textInfo = "Informe seus dados"; // Variável

  // Método para realizar o cadastro de usuário
  void _cadastro() {
    setState(() {
      String user = usuarioController.text; // Obtém o valor do campo de usuário
      String senha = senhaController.text; // Obtém o valor do campo de senha
      if (user.isEmpty || senha.isEmpty) { // Verifica se os campos estão vazios
        _textInfo = "O campos estão vazios";
      } else {
        _textInfo = "Usuario foi cadastrado com sucesso";
      }
    });
  }

  // Método para limpar os campos de texto e a mensagem de informação
  void _limpar_tela(){
    usuarioController.text = ""; // Limpa o campo de usuário
    senhaController.text = ""; // Limpa o campo de senha
    setState(() {
      _textInfo = "Informe seus dados";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Define o AppBar da tela
      appBar: AppBar(
        title: Text("Cadastro de usuario"), // Define o título da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        actions: <Widget>[
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh)) // Adiciona um ícone de ação para limpar os campos
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os elementos à esquerda
          children: <Widget>[
            const Icon(
              Icons.person, // Ícone de usuário
              size: 120.0,
              color: Colors.blue, // Cor do ícone
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Usuario",
                  labelStyle: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.center, // Alinha o texto ao centro
              style: TextStyle(fontSize: 25.0), // Define o tamanho da fonte
              controller: usuarioController, // Define o controlador para o campo de usuário
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.center, // Alinha o texto ao centro
              style: TextStyle(fontSize: 25.0), // Define o tamanho da fonte
              obscureText: true, // Oculta a senha
              controller: senhaController, // Define o controlador para o campo de senh
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro, // Define a ação ao botão
                  child: const Text("Cadastre-se"), // Define o texto do botão
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center, // Alinha o texto ao centro
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
