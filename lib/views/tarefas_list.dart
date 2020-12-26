import 'package:flutter/material.dart';
import 'package:CursoFlutter/data/dummy_tarefas.dart';

class TarefasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const tarefas = {...TAREFAS};
    return Scaffold(
      appBar: AppBar(
        title : Text('lista de tarefas '),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i)=> Text(tarefas.values.elementAt(i).name),
        itemCount: tarefas.length,
      ),
    );
  }
}