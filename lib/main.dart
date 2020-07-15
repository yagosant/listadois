import 'package:flutter/material.dart';
import 'package:listadois/tarefa.dart';

void main(){
  runApp(MaterialApp(
   home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  //metodo para adicionar
  void addTarefa(String nome){
    setState(() {
      //recebendo o nome
      tarefas.add(Tarefa(nome));
    });
    controller.clear();

  }

  Widget getItem(Tarefa tarefa){
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(tarefa.concluida ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.green),
          iconSize: 42.0,
          onPressed: (){
            setState(() {
              tarefa.concluida = true;
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tarefa.nome, style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold
            ),),
            Text(tarefa.data.toIso8601String())
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas 02"),
        backgroundColor: Colors.cyan,
        centerTitle: true,

      ),

      //conf do body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: addTarefa
            ),
          ),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (_, index){
                  return getItem(tarefas[index]);
                },

              ),
            )
        ],
      ),
    );
  }
}
