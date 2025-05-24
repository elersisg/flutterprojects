import 'package:flutter/material.dart';

import 'components/todo_title.dart';

class Home extends StatefulWidget {
   Home({super.key});

  List taskList = [
    ["Dar clases", false],
    ["Comprar cena:", false],
    []
  ];

  //Metodo para hacer que cambie el estado de los checkboxes
   void checkBoxChanged(bool? value, int index){
     taskList[index][1] = !taskList[index][1];

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do APp'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(120),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index){
            return TodoTitle(taskName: taskList[index][0],
              taskComplete: taskList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

      },
      shape: CircleBorder(eccentricity: 1),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  State<Home> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
