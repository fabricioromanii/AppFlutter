import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CursoFlutter/provider/tarefas.dart';
import 'package:flutter/widgets.dart';
import 'package:CursoFlutter/models/tarefas.dart';

class TarefaForm extends StatefulWidget {
  @override
  _TarefaFormState createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Tarefa tarefa){
    if(tarefa != null){
    _formData['id'] = tarefa.id;
    _formData['name'] = tarefa.name;
    _formData['prazo'] = tarefa.prazo;
    _formData['classificacao'] = tarefa.classificacao;  
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     final Tarefa tarefa = ModalRoute.of(context).settings.arguments;
    _loadFormData(tarefa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova tarefa"),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration:InputDecoration(labelText: "Tarefa"),
                validator:(value){
                  if(value == null || value.isEmpty){
                    return "obrigatório";
                  }
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['prazo'],
                decoration:InputDecoration(labelText: "Prazo"),
                onSaved: (value) => _formData['prazo'] = value,
              ),
              TextFormField(
                initialValue: _formData['classificacao'],
                decoration:InputDecoration(labelText: "Importancia"),
                onSaved: (value) => _formData['classificacao'] = value,
              ),
              RaisedButton(
                child: Text('salvar'),
                onPressed: () {
                 final isValid = _form.currentState.validate();
                 if(isValid) {
                    _form.currentState.save();
                    Provider.of<Tarefas>(context,listen:false).put(Tarefa(
                      id: _formData['id'],
                      name: _formData['name'],
                      prazo: _formData['prazo'],
                      classificacao: _formData['classificacao'],
                    ));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}