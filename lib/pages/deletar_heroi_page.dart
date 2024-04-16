import 'package:flutter/material.dart';
import '../models/heroes.dart';
import 'dart:io';
import '../controllers/heroes_controller.dart';

class DeletaHeroiPage extends StatefulWidget {
  DeletaHeroiPage({Key? key}) : super(key: key);

  @override
  _DeletaHeroiPage createState() => _DeletaHeroiPage();
}

class _DeletaHeroiPage extends State<DeletaHeroiPage> {
  deletarHeroi(int index) {
    HeroesController controller = HeroesController();
    bool sucesso = controller.delete(listaHerois, index);

    if (sucesso) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Heroi deletado ao repositorio!!!')));
    }
  }

  static getAll() {
    HeroesController controller = HeroesController();
    return controller.selectAll();
  }

  List<Heroes> listaHerois = getAll();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deletar Heroi')),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: (listaHerois[index].imagem.contains('images/'))
                  ? Image.asset(listaHerois[index].imagem)
                  : Image.file(File(listaHerois[index].imagem)),
              title: Text(listaHerois[index].nomeHeroi),
              trailing: Text(listaHerois[index].nome),
              onLongPress: () => deletarHeroi(index),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: listaHerois.length),
    );
  }
}
