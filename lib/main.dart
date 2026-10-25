// Aluno: Vinicius Silvestre
// Aplicativo: Turismo na Baixada Santista - Etapa 2
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

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagem;

  const PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagem,
  });
}

class TelaCatalogo extends StatelessWidget {
  const TelaCatalogo({super.key});

  static const List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      descricao: 'Museu instalado no antigo prédio da Bolsa Oficial de Café, no Centro Histórico.',
      imagem: 'https://loremflickr.com/900/500/coffee,museum',
    ),
    PontoTuristico(
      nome: 'Aquário Municipal',
      cidade: 'Santos',
      descricao: 'Espaço de educação ambiental dedicado à vida marinha.',
      imagem: 'https://loremflickr.com/900/500/aquarium,fish',
    ),
    PontoTuristico(
      nome: 'Jardins da Orla',
      cidade: 'Santos',
      descricao: 'Jardins à beira-mar que acompanham parte da orla de Santos.',
      imagem: 'https://loremflickr.com/900/500/beach,garden',
    ),
    PontoTuristico(
      nome: 'Ponte Pênsil',
      cidade: 'São Vicente',
      descricao: 'Ponte histórica suspensa que liga a ilha de São Vicente ao continente.',
      imagem: 'https://loremflickr.com/900/500/suspension,bridge',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'São Vicente',
      descricao: 'Local conhecido pelas vistas panorâmicas do litoral.',
      imagem: 'https://loremflickr.com/900/500/coast,view',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      descricao: 'Complexo militar histórico próximo à entrada da Baía de Santos.',
      imagem: 'https://loremflickr.com/900/500/fortress,coast',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongaguá',
      descricao: 'Estrutura sobre o mar conhecida pela pesca e pela paisagem costeira.',
      imagem: 'https://loremflickr.com/900/500/fishing,pier',
    ),
  ];

  Widget construirCartao(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              ponto.imagem,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 160,
                  child: Center(child: Icon(Icons.landscape, size: 60)),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            ponto.nome,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.teal, size: 18),
              const SizedBox(width: 4),
              Text(ponto.cidade),
            ],
          ),
          const SizedBox(height: 8),
          Text(ponto.descricao),
        ],
      ),
    );
  }

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
        itemCount: pontos.length,
        itemBuilder: (context, indice) => construirCartao(pontos[indice]),
      ),
    );
  }
}
