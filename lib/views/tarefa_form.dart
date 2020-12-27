import 'package:flutter/material.dart';

class TarefaForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:InputDecoration(labelText: "Tarefa"),
                validator:(value){
                  return "obrigatório";
                },
              ),
              TextFormField(
                decoration:InputDecoration(labelText: "Prazo"),
              ),
              TextFormField(
                decoration:InputDecoration(labelText: "Importancia"),
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                 final isValid = _form.currentState.validate();
                 if(isValid) {_form.currentState.save();
                  Navigator.of(context).pop();}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}