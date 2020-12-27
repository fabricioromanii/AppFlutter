import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CursoFlutter/components/TarefaTile.dart';
import'package:CursoFlutter/provider/tarefas.dart';
import 'package:CursoFlutter/routes/appRoutes.dart';
class TarefaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Tarefas tarefas = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
      title : Text('Adicionar tarefas'),
      actions:[
        IconButton(
          icon: Icon(Icons.add),
          iconSize:30,
          color: Colors.white,
          onPressed: (){
           Navigator.of(context).pushNamed(
             AppRoutes.TAREFA_FORM
           );
          },
        ),
      ],      
       backgroundColor: Colors.grey[900],
       ),
      body: ListView.builder(
        itemCount: tarefas.count,
        itemBuilder: (ctx,i) => TarefaTile(tarefas.byIndex(i)),
      ),
    );
  }
}