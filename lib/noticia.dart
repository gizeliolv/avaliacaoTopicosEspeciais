import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'integracaoNoticia.dart';

class Noticia extends StatefulWidget {
  @override
  _RequirementState createState() => _RequirementState();
}

class _RequirementState extends State<Noticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Noticia'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //onPressed: () => _createNewRequirement(context),
      ),
    );
  }

  Widget _buildBody(BuildContext) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Noticia').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItemReq(context, data)).toList(),
    );
  }

  Widget _buildListItemReq(BuildContext context, DocumentSnapshot data) {
    final record = IntegrationRequirement.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.conteudo),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color (0xFFcfff9f),
            boxShadow: [
              new BoxShadow(
                  offset: new Offset(0.0, 1.0),
                  spreadRadius: 1.0,
                  color: Colors.black12
              )
            ],
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(
          title: Text(record.conteudo),
          subtitle: Text(record.titulo.toString()),
          leading: Icon(Icons.description, color: Colors.blueGrey, size: 20),
          trailing: GestureDetector(
            child: Icon(Icons.delete_outline, color: Colors.red, size: 20),
            onTap: () {
              record.delete();
            },
          ),
          onTap: () {
        //    _navigateIntegrationRequirement(context, record);
          },
        ),
      ),
    );
  }
}
/*
void _navigateIntegrationRequirement(BuildContext context, IntegrationRequirement integrationRequirement) async {
  String result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => RequirementScreen(integrationRequirement)));

  if(result == 'update') {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Documento atualizado com sucesso!'))
    );
  }
}

void _createNewRequirement(BuildContext context) async {
  String result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => RequirementScreen(IntegrationRequirement('',''))));

  if(result == 'save') {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Novo documento incluso'))
    );
  }
}
 */