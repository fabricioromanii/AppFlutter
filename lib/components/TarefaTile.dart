import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CursoFlutter/models/tarefas.dart';
import 'package:CursoFlutter/routes/appRoutes.dart';
import 'package:provider/provider.dart';
import 'package:CursoFlutter/provider/tarefas.dart';

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
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.TAREFA_FORM,
                  arguments: tarefa,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                showDialog(context: context,
                builder:(ctx) => AlertDialog(
                  title: Text("excluir usuario"),
                  content: Text("tem certeza?"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("cancelar"),
                    ),
                    FlatButton(
                      onPressed: (){
                        Provider.of<Tarefas>(context,listen:false).remove(tarefa);
                        Navigator.of(context).pop();
                      },
                      child: Text("confirmar"),
                    ),
                  ],
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}