import 'package:flutter/material.dart';

class Tarefa {
  //atributos
  String nome;
  DateTime data;
  bool concluida;

  //criando o construtor
  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }
}
