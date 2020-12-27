import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CursoFlutter/models/tarefas.dart';

class TarefaTile extends StatelessWidget{
  final Tarefa tarefa;
  const TarefaTile(this.tarefa);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.assignment_outlined),
      title: Text(tarefa.name),
      subtitle: Text(tarefa.prazo),
      trailing:Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}