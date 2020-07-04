import 'package:cloud_firestore/cloud_firestore.dart';

class IntegrationRequirement {

  String disciplina;
  String aluno;
  String data;
  String mensagem;
  DocumentReference referenciae;

  final String _colecaoe = 'Requisicao';

  IntegrationRequirement(this.disciplina, this.aluno, this.data, this.mensagem);

  IntegrationRequirement.fromMap(Map<String, dynamic> map, {this.referenciae})

      : assert(map['disciplina'] != null),
        assert(map['aluno'] != null),
        assert(map['data'] != null),
        assert(map['mensagem'] != null),

  disciplina = map['disciplina'],
  aluno = map['aluno'],
  data = map['data'],
  mensagem = map['mensagem'];

  IntegrationRequirement.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, referenciae: snapshot.reference);

  Map<String, dynamic> toJson() =>  {

    /* {coment} criando os campos para serem utilizados como JSON*/
    'disciplina': disciplina,
    'aluno' : aluno,
    'data' : data,
    'mensagem' : mensagem,
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
  String toString() => "Record<$disciplina:$aluno:$data:$mensagem>";
}