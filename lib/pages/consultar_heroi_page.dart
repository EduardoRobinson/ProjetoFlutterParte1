import 'package:flutter/material.dart';
import '../models/heroes.dart';
import 'mostrar_detalhes_heroi.dart';
import 'dart:io';
import '../controllers/heroes_controller.dart';

class ConsultaHeroiPage extends StatefulWidget {
ConsultaHeroiPage({Key?key}):super(key:key);

@override
_ConsultaHeroiPage createState() => _ConsultaHeroiPage();


}


class _ConsultaHeroiPage extends State<ConsultaHeroiPage>{

mostrarDetalhes(Heroes heroe){
  Navigator.push(context,MaterialPageRoute(
      builder: (_)=>MostrarDetalhesHeroiPage(heroe: heroe)));
}

static getAll(){
  HeroesController controller = HeroesController();
  return controller.selectAll();
}


List <Heroes> listaHerois=getAll();
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title:Text('Consultar Herois'),
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: ListView.separated(
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          leading:(listaHerois[index].imagem.contains('images/')) ? Image.asset(listaHerois[index].imagem):Image.file(File(listaHerois[index].imagem)),
          title: Text(listaHerois[index].nomeHeroi),
          trailing: Text(listaHerois[index].nome),
          onTap:() => mostrarDetalhes(listaHerois[index]),
        );
      }, 
      padding: EdgeInsets.all(16),
      separatorBuilder: (_,__)=>Divider(),
       itemCount: listaHerois.length),
  );
}


}