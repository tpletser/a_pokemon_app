import 'package:flutter/material.dart';
import 'package:pkmn_app_yt/pokedex.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  final Pokehub pokehub;

  PokemonDetails({this.pokemon, this.pokehub});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Height :${pokemon.height}'),
                Text('Weight :${pokemon.weight}'),
                Column(
                  children: <Widget>[
                    Text('Next Evolution',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pokemon.type
                            .map((t) => FilterChip(
                                  label: Text(t),
                                  onSelected: (b) {},
                                  backgroundColor: TypeColor(t),
                                ))
                            .toList()),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Weakness',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pokemon.weaknesses
                            .map((t) => FilterChip(
                                  label: Text(t),
                                  onSelected: (b) {},
                                  backgroundColor: TypeColor(t),
                                ))
                            .toList()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          children: <Widget>[
                        Text('Previous Evolution',
                            style: TextStyle(fontWeight: FontWeight.bold)),
    pokemon.prevEvolution != null
    ? (SizedBox(
                          height: 100,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemCount: pokemon.prevEvolution.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(pokehub.pokemon[int.parse(pokemon.prevEvolution[index].num)-1].img))),
                                );
                              }),
                        )): Container(height: 100,),
                      ],
                      )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: <Widget>[
                              Text('Next Evolution',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
    pokemon.nextEvolution != null
    ? (SizedBox(
                                height: 100,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: pokemon.nextEvolution.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(pokehub.pokemon[int.parse(pokemon.nextEvolution[index].num)-1].img))),
                                      );
                                    }),
                              )): Container(height: 100,),
                            ]))
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
            ),
          ),
        )
      ],
    );
  }

  Color TypeColor(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFFA8A878);
        break;
      case 'Fire':
        return Color(0xFFF08030);
        break;
      case 'Fighting':
        return Color(0xFFC03028);
        break;
      case 'Water':
        return Color(0xFF6890F0);
        break;
      case 'Flying':
        return Color(0xFFA890F0);
        break;
      case 'Grass':
        return Color(0xFF78C850);
        break;
      case 'Poison':
        return Color(0xFFA040A0);
        break;
      case 'Electric':
        return Color(0xFFF8D030);
        break;
      case 'Ground':
        return Color(0xFFE0C068);
        break;
      case 'Psychic':
        return Color(0xFFF85888);
        break;
      case 'Rock':
        return Color(0xFFB8A038);
        break;
      case 'Ice':
        return Color(0xFF98D8D8);
        break;
      case 'Bug':
        return Color(0xFFA8B820);
        break;
      case 'Dragon':
        return Color(0xFF7038F8);
        break;
      case 'Ghost':
        return Color(0xFF705898);
        break;
      case 'Dark':
        return Color(0xFF705848);
        break;
      case 'Steel':
        return Color(0xFFB8B8D0);
        break;
      case 'Fairy':
        return Color(0xFFEE99AC);
        break;
      default:
        return Colors.amber;
        break;
    }
  }
}
