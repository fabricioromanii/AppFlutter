import 'package:flutter/widgets.dart';
import'package:flutter/material.dart';
import 'package:CursoFlutter/data/dummy_tarefas.dart';
import 'package:CursoFlutter/models/tarefas.dart';
import 'dart:math';

class Tarefas with ChangeNotifier{
  final Map<String, Tarefa> _items = {...TAREFAS};

  List<Tarefa> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }
  Tarefa byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Tarefa tarefa){
    if(tarefa == null){
      return;
    }
    if(tarefa.id != null && !tarefa.id.trim().isNotEmpty && _items.containsKey(tarefa.id)){
      _items.update(tarefa.id, (_) => Tarefa(
        id: tarefa.id,
        name:tarefa.name,
        prazo: tarefa.prazo,
        classificacao:tarefa.classificacao,
      ),
      );
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Tarefa(
        id: id,
        name: tarefa.name,
        prazo: tarefa.prazo,
        classificacao: tarefa.classificacao,
      ),
      );
    }
    notifyListeners();
  } 
  
  void remove(Tarefa tarefa){
    if(tarefa != null && tarefa.id != null){
      _items.remove(tarefa.id);
      notifyListeners();
    }
  }
}