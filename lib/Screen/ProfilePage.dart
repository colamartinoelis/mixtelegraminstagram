import 'package:flutter/material.dart';
import 'package:mixtigrameli/Model/ListaFoto.dart';

List<dynamic> _y = foto;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: [
          appBarProfile(context),
          spazioTitolo(title: 'My photo'),
          grigliaImmagini(),
          spazioTitolo(title: 'Contatti Social'),
          listaSocial(),
        ],
      ),
    );
  }
}

Widget appBarProfile(BuildContext context) => new SliverAppBar(
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context)),
      title: new Text('Cleffy'),
      centerTitle: false,
      expandedHeight: 350,
      flexibleSpace: new FlexibleSpaceBar(
        background: new Image.asset(
          "Immagini/xx.jpg",
          fit: BoxFit.cover,
        ),
      ),
      /*flexibleSpace: new FlexibleSpaceBar(background: new Image.network
    ("https://picsum.photos/id/1062/200/200", fit: BoxFit.cover,),),*/
    );

Widget spazioTitolo({@required String title}) {
  return new SliverPadding(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
      sliver: new SliverToBoxAdapter(
        child: new Text(
          title,
          style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
}

Widget grigliaImmagini() => new SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    sliver: new SliverGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(18, (index) => contenitoreFoto(index))));

/*new SliverGrid(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // numero di elementi per riga
      mainAxisSpacing: 3, // spazio tra elementi in riga
      crossAxisSpacing: 3, //spazio tra elementi in colonna
      childAspectRatio: 1, //lunghezza e larghezza),
    ),
    delegate: new SliverChildListDelegate(List.generate(
        100,
*/ /* poteva essere scritto anche in questo modo*/ /*
*/ /*oppure*/ /*
//y?.length ?? 0, nel caso y == null settare zero come lista
        (index) => new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(_y[index % _y.length]["url"]),
                      fit: BoxFit.cover)),
            ))));*/
Widget contenitoreFoto(int index) => Container(
    decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new NetworkImage(_y[index % _y.length]["url"]),
            fit: BoxFit.cover)));

Widget listaSocial() {
  return new SliverSafeArea(
      top: false,
      minimum: EdgeInsets.symmetric(horizontal: 10),
      sliver: new SliverList(
          delegate: new SliverChildListDelegate([
        contactButton(nome: "Instagram", color: Colors.deepPurpleAccent),
        contactButton(nome: "Facebook", color: Colors.indigo),
        contactButton(nome: "Twitter", color: Colors.blue),
      ])));
}

Widget contactButton({@required String nome, @required Color color}) {
  return new MaterialButton(
    textColor: Colors.white,
    height: 40,
    color: color,
    onPressed: () {},
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5),
    ),
    child: new Text(nome),
  );
}
