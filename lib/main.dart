import 'package:flutter/material.dart';
import 'package:projeto/pages/consultar_heroi_page.dart';
import 'package:projeto/pages/deletar_heroi_page.dart';
import 'package:projeto/pages/adicionar_heroi_page.dart';
import 'package:projeto/pages/editar_heroi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes Repository',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Heroes Repository'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  consultarHeroi() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ConsultaHeroiPage()));
  }

  adicionarHeroi() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => AdicionarHeroiPage()));
  }

  deleteHeroi() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => DeletaHeroiPage()));
  }

  editarHeroi() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EditarHeroiPage()));
  }

  @override
  Widget build(BuildContext context) {
    List<String> opcoes = [
      "Consultar Heroi",
      "Adicionar Heroi",
      "Editar Heroi",
      "Deletar Heroi"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Image.asset("images/herois.jpg", width: 400, height: 300),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: opcoes.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: () {
                    if (opcoes[index] == 'Consultar Heroi') {
                      consultarHeroi();
                    }
                    if (opcoes[index] == 'Adicionar Heroi') {
                      adicionarHeroi();
                    }
                    if (opcoes[index] == 'Editar Heroi') {
                      editarHeroi();
                    }
                    if (opcoes[index] == 'Deletar Heroi') {
                      deleteHeroi();
                    }
                  },
                  child: Text(opcoes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
