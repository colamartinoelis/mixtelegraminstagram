import 'package:flutter/material.dart';
import 'package:mixtigrameli/Model/ListaFoto.dart';

List<dynamic> _foto = foto;

// trucco per avere le foto fino a 100 --> _foto[index % _foto.length]

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: [
          appBar(),
          listContact(context),
        ],
      ),
    );
  }
}

Widget appBar() => new SliverAppBar(
      floating: true,
      snap: true,
      leading: new IconButton(icon: new Icon(Icons.dehaze), onPressed: () {}),
      title: new Text("MixTIgramELI"),
      centerTitle: false,
      actions: [
        new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () => print('cerca'),
        )
      ],
    );

Widget listContact(BuildContext context) => new SliverList(
        delegate: new SliverChildBuilderDelegate(
      (context, index) => pannelloContatto(context, index),
      childCount: 100,
    ));

Widget pannelloContatto(BuildContext context, int index) => new ListTile(
      onTap: () => Navigator.pushNamed(context, "/profilePage"),
      leading: new CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: new NetworkImage(_foto[index % _foto.length]['url']),
      ),
      title: new Text(_foto[index % _foto.length]['name']),
      subtitle: new Text(_foto[index % _foto.length]['subtitle']),
      trailing: new Text(
        "3 days ago",
        style: new TextStyle(fontSize: 12, color: Colors.grey.shade400),
      ),
    );
