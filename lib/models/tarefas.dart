import 'package:flutter/material.dart';

class Tarefa{
  final String id;
  final String name;
  final String prazo;
  final String classificacao;
  //final int tipo; // 1 faculdade - 2 casa - 3 compras - 4 reunioes - 5 feito

  const Tarefa({ 
    this.id,
    //@required this.tipo,
    @required this.name,
    @required this.prazo,
    @required this.classificacao,
  });
}