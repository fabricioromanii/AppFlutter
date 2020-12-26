import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CursoFlutter/views/tarefas_list.dart';

main(){
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Organizador De Tarefas"),
            backgroundColor: Colors.green[900],
            elevation: 4.0,
            actions:[
              IconButton(
                icon: Icon(Icons.add_outlined),
                iconSize:40,
                color: Colors.white,
                onPressed: (){},
              ),
            ],
            bottom: TabBar(
              isScrollable:true,
              tabs: choices.map<Widget>((Choice choice){
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body:TarefasList(),
        ),  
      ),
    );
  }
}

class Choice{
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title:'Todos',icon: Icons.assignment_outlined),
  Choice(title:'Faculdade',icon: Icons.library_books),
  Choice(title:'Casa',icon: Icons.house),
  Choice(title:'Reuniões',icon: Icons.people_alt_outlined),
  Choice(title:'Feito',icon: Icons.assignment_turned_in_outlined),
];

class ChoicePage extends StatelessWidget{
  const ChoicePage({Key key, this.choice}):super(key:key);
  final Choice choice;
  @override
  Widget build(BuildContext context){
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon,color:textStyle.color,),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}