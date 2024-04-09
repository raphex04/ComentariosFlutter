// Importa o pacote do Flutter
import 'package:flutter/material.dart';


void main() {
  // Executa o Flutter.
  runApp(const MyApp());
}

// Classe MyApp que define o widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Define o AppBar da tela
        appBar: AppBar(
          title: const Text('Tela contador'), // Define o título da AppBar
          centerTitle: true, // Centraliza o título na AppBar
          backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        ),
        // Define o corpo da tela
        body: Center(
          child: ElevatedButton(
            // Cria um botão elevado que leva para a tela de cadastro de usuários
              child: const Text('Leva pra tela de cadastro dos usuarios'), // Define o texto do botão
              onPressed: (){
                // Define a ação
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

// Classe Cont que define o widget para a tela do contador
class Cont extends StatefulWidget {
  const Cont({super.key});



  @override
  State<Cont> createState() => _ContPageState();
}

// Classe de estado _ContPageState que gerencia o estado do widget Cont
class _ContPageState extends State<Cont> {
  int _counter = 0; // Variável

  // Método para incrementar o contador
  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa o contador
    });
  }

  // Método para decrementar o contador
  void _decrementCounter() {
    setState(() {
      _counter--; // Decrementa o contador
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Define o AppBar da tela
      appBar: AppBar(
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        title: Text("Texto teste"), // Define o título da AppBar
      ),
      // Define o corpo da tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha os elementos na vertical

          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter', // Mostra o valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // Define o estilo do texto.
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os elementos na horizontal
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter, // Define a ação ao pressionar o botão
                  child: const Icon(Icons.add), // Ícone do botão de incremento
                ),

                ElevatedButton(
                  onPressed: _decrementCounter, // Define a ação ao pressionar o botão
                  child: const Icon(Icons.remove), // Ícone do botão
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
