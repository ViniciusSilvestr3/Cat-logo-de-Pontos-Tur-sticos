// Aluno: Vinicius Silvestre
// Aplicativo: Turismo na Baixada Santista - Etapa 1
import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  // Nome do aluno: Vinicius Silvestre
  static const String nomeAluno = 'Vinicius Silvestre';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo na Baixada Santista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TelaCatalogo(),
    );
  }
}

class TelaCatalogo extends StatelessWidget {
  const TelaCatalogo({super.key});

  static const List<String> nomesPontos = [
    'Museu do Café',
    'Aquário Municipal',
    'Jardins da Orla',
    'Ponte Pênsil',
    'Ilha Porchat',
    'Fortaleza de Itaipu',
    'Plataforma de Pesca',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Turismo na Baixada Santista', style: TextStyle(fontSize: 18)),
            Text(Principal.nomeAluno, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: nomesPontos.length,
        itemBuilder: (context, indice) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Text(
              nomesPontos[indice],
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
