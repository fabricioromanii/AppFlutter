import 'package:flutter/material.dart';
import 'package:CursoFlutter/data/dummy_tarefas.dart';
import 'package:CursoFlutter/components/TarefaTile.dart';

class TarefasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final tarefas = {...TAREFAS};

    return Scaffold(
      appBar: AppBar(
        title : Text('lista de tarefas'),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (ctx,i)=> TarefaTile(tarefas.values.elementAt(i)),
      ),
    );
  }
}