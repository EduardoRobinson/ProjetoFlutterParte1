import '../models/heroes.dart';
import '../repository/heroes_repository.dart';
class HeroesController {
static List <Heroes> lista=[];


save(List <Heroes> lista,Heroes heroi){

lista.add(heroi);
return true;

}

delete(List <Heroes> lista,int index){

if (index >= 0 && index < lista.length){
  lista.removeAt(index);
}
return true;

}

selectAll(){

return HeroesRepository.lista;

}

edit(List <Heroes> lista,int index,String nome,String nomeHeroi,String poderes,String anoCriacao,String criador,String origem){
lista[index].nome=nome;
lista[index].nomeHeroi=nomeHeroi;
lista[index].poderes=poderes;
lista[index].anoCriacao=anoCriacao;
lista[index].criador=criador;
lista[index].origem=origem;
return true;

}



}