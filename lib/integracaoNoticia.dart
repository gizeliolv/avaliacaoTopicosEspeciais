import 'package:cloud_firestore/cloud_firestore.dart';

class IntegrationRequirement {

  String titulo;
  String data;
  String conteudo;
  DocumentReference referenciae;

  final String _colecaoe = 'Noticia';

  IntegrationRequirement(this.titulo, this.data, this.conteudo);

  IntegrationRequirement.fromMap(Map<String, dynamic> map, {this.referenciae})


      : assert(map['titulo'] != null),
        assert(map['data'] != null),
        assert(map['conteudo'] != null),

  titulo = map['titulo'],
  data = map['data'],
  conteudo = map['conteudo'];

  IntegrationRequirement.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, referenciae: snapshot.reference);

  Map<String, dynamic> toJson() =>  {

    'titulo': titulo,
    'data' : data,
    'conteudo' : conteudo,
  };

  create() async {
    this.referenciae = await Firestore.instance.collection(_colecaoe).add(this.toJson());
  }

  update() async {
    await this.referenciae.updateData(this.toJson());
  }

  delete() async {
    await this.referenciae.delete();
  }

  @override
  String toString() => "Record<$titulo:$data:$conteudo>";
}