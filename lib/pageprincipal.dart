import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastroRequisicao.dart';
import 'noticia.dart';
import 'requisicao.dart';
import 'disciplina.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('imagens/logo.jpg',
                  height: 150,
                  width: double.infinity,
                ),
              ],
            ),
            Divider(),
            ButtonTheme(
                child: Container(
                  height: 80,
                  width: 332,
                  decoration: new BoxDecoration(border: new Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  ),
                  child: RaisedButton(
                    color: const Color (0xFF92d050),
                    onPressed: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => Noticia()));
                    },
                    child: Text("Noticias", style: TextStyle(fontSize: 25),),
                  ),
                )
            ),
            Divider(),
            ButtonTheme(
                child: Container(
                  height: 80,
                  width: 332,
                  decoration: new BoxDecoration(border: new Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  ),
                  child: RaisedButton(
                    color: const Color (0xFF92d050),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => Disciplina()));
                    },
                    child: Text("Disciplina", style: TextStyle(fontSize: 25),), /* {coment} descricao Disciplina*/
                  ),
                )
            ),
            Divider(),
            ButtonTheme(
                child: Container(
                  height: 80,
                  width: 332,
                  decoration: new BoxDecoration(border: new Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  ),
                  child: RaisedButton(
                    color: const Color (0xFF92d050),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => Requisicao()));
                    },
                    child: Text("Requisições", style: TextStyle(fontSize: 25),), /* {coment} descricao requisições*/
                  ),
                )
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: Column(children: [Text("Versão 1.0")]),
            )
          ]
      ),
    );
  }
}