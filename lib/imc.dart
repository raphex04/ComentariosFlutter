// Importa a biblioteca 'dart:math'
import 'dart:math';
// Importa o pacote do Flutter
import 'package:flutter/material.dart';
// Importa o arquivo contador.dart
import 'contador.dart';


// Função principal do Flutter
void main() {
  // Executa o Flutter
  runApp(const MyApp());
}

// Classe MyApp que define o widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o AppBar
        appBar: AppBar(
          title: const Text('Tela imc'), // Define o título da AppBar
          centerTitle: true, // Centraliza o título na AppBar
          backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        ),
        // Define o corpo da tela
        body: Center(
          child: ElevatedButton(
            // Cria um botão para ir ao contador
              child: const Text('Leva pra tela de contador'), // Define o texto do botão
              onPressed: (){
                // Define a ação
                Navigator.pushNamed(
                    context,
                    '/contador' // Navega para a tela de contador
                );
              }
          ),
        )
    );
  }
}

// Classe Imc que define o widget para calcular o IMC
class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcPageState(); // Cria o estado para o widget Imc
}

// Classe _ImcPageState que gerencia o widget Imc
class _ImcPageState extends State<Imc> {
  // Controladores para os campos de texto de peso e altura.
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();

  String _textoInfo = "Informe seus dados";

  // Método para limpar os campos de texto
  void _limpar_tela(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo= "Informe seus dados";
    });
  }

  void _calcular_Imc(){
    setState(() {
      // Converte os textos para números
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      // Calcula o IMC
      double imc = peso / pow((altura/100), 2);


      if(imc < 16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if(imc <= 18.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if(imc <= 24.9){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if(imc <= 29.9){
        _textoInfo = "Sobre peso (${imc})";
      }
      else if(imc <= 34.9){
        _textoInfo = "Obesidade grau 1(${imc})";
      }
      else if(imc <= 39.9){
        _textoInfo = "Obesidade grau 2(${imc})";
      }
      else{
        _textoInfo = "Obesidade grau 3(${imc})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // Define o AppBar
        appBar: AppBar(
        title: Text("Calculadora IMC"), // Define o título da AppBar
    centerTitle: true, // Centraliza o título na AppBar
    backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
    actions: <Widget>[

    IconButton(
    onPressed: _limpar_tela, // Define a ação
    icon: Icon(Icons.refresh) // Define o ícone do botão
    )
    ],
    ),

    body: SingleChildScrollView (

    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    // Define uma coluna para organizar na vertical
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

    const Icon(
    Icons.person_outline,
    size: 120.0,
    color: Colors.blue,
    ),

    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: "PESO(Kg)",
    labelStyle: TextStyle(color: Colors.blue)
    ),
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 25.0), // Define o tamanho do texto.
    controller: pesoController,
    ),

    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: "ALTURA(CM)",
    labelStyle: TextStyle(color: Colors.blue)
    ),
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
    controller: alturaController,
    ),
    // Botão para executar o cálculo do IMC
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: SizedBox(
    height:50.0,
    child: ElevatedButton(
    onPressed:_calcular_Imc,
        child: const Text("Calcular")
    ),
    ),
    ),
      Text(
        _textoInfo,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue,
            fontSize: 25.0
        ),
      ),
    ]
    ),
    ),
    );
  }
}