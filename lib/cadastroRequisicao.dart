import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'integracaoRequisicao.dart';

class RequirementScreen extends StatefulWidget {
  final IntegrationRequirement integrationRequirement;
  RequirementScreen(this.integrationRequirement);

  @override
  State<StatefulWidget> createState() => new _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {

  TextEditingController _disciplinaController;
  TextEditingController _alunoController;
  TextEditingController _dataController;
  TextEditingController _mensagemController;

  @override
  void initState() {
    super.initState();
    /*{coment} criando os campos necessarios */
    _disciplinaController = new TextEditingController(text: widget.integrationRequirement.disciplina);
    _alunoController = new TextEditingController(text: widget.integrationRequirement.aluno);
    _dataController = new TextEditingController(text: widget.integrationRequirement.data);
    _mensagemController = new TextEditingController(text: widget.integrationRequirement.mensagem);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de requisição'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _disciplinaController, /*{coment} criando os campos necessarios */
              decoration: InputDecoration(
                  labelText: 'Disciplina'       /*{coment} criando os campos necessarios */
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _alunoController, /*{coment} criando os campos necessarios */
              decoration: InputDecoration(
                  labelText: 'Aluno'        /*{coment} criando os campos necessarios */
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _dataController, /*{coment} criando os campos necessarios */
              decoration: InputDecoration(
                  labelText: 'Data'        /*{coment} criando os campos necessarios */
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _mensagemController, /*{coment} criando os campos necessarios */
              decoration: InputDecoration(
                  labelText: 'Mensagem'        /*{coment} criando os campos necessarios */
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            RaisedButton(
              child: (widget.integrationRequirement.referenciae != null) ? Text('Atualizar') : Text('Adicionar'),
              onPressed: () {
                if(widget.integrationRequirement.referenciae != null) {             /*{coment} atualiza os dados no banco*/
                  widget.integrationRequirement.disciplina = _disciplinaController.text;
                  widget.integrationRequirement.aluno = _alunoController.text;
                  widget.integrationRequirement.data = _dataController.text;
                  widget.integrationRequirement.mensagem = _mensagemController.text;

                  widget.integrationRequirement.update().then((_) {
                    Navigator.pop(context, 'update');
                  });
                }else {                                          /*{coment} insere os dados no banco*/
                  IntegrationRequirement(
                      _disciplinaController.text,
                      _alunoController.text,
                      _dataController.text,
                      _mensagemController.text
                  ).create().then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}