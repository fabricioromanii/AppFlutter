import 'package:flutter/widgets.dart';

import'package:flutter/material.dart';
import 'package:CursoFlutter/data/dummy_tarefas.dart';
import 'package:CursoFlutter/models/tarefas.dart';

class Tarefas with ChangeNotifier{
  Map<String, Tarefa> _items = {...TAREFAS};

  List<Tarefa> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  
}