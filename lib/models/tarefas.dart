import 'package:flutter/material.dart';

class Tarefa{
  final String id;
  final String name;
  final String prazo;
  final String classificacao;

  const Tarefa({ 
    this.id,
    @required this.name,
    @required this.prazo,
    @required this.classificacao,
  });
}