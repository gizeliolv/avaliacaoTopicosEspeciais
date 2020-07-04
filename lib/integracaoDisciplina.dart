import 'package:cloud_firestore/cloud_firestore.dart';

class IntegrationRequirement {

  String nome;
  String media;
  String frequencia;
  String professor;
  String conteudo;

  DocumentReference referenciae;

  final String _colecaoe = 'Disciplina';

  IntegrationRequirement(this.nome, this.media, this.frequencia);

  IntegrationRequirement.fromMap(Map<String, dynamic> map, {this.referenciae})


      : assert(map['nome'] != null),
        assert(map['media'] != null),
        assert(map['frequencia'] != null),

  nome = map['nome'],
  media = map['media'],
  frequencia = map['frequencia'];

  IntegrationRequirement.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, referenciae: snapshot.reference);

  Map<String, dynamic> toJson() =>  {

    'nome': nome,
    'media' : media,
    'frequencia' : frequencia,
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
  String toString() => "Record<$nome:$media:$frequencia:$conteudo:$professor>";
}