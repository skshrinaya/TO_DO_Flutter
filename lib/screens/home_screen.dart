import 'package:flutter/material.dart';

import '../model/todo.dart';

class HomeScreen extends StatelessWidget {
  final ToDo todo;
  final ToDoChange;
  final ToDoDelete;
  const HomeScreen({Key? key,required this.todo,required this.ToDoChange,required this.ToDoDelete}): super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:ListTile(
        onTap: (){
          //print('Clicked');
          ToDoChange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        tileColor: Colors.white70,
        leading: Icon(todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color:Colors.blue),
        title: Text(todo.text!,style: TextStyle(fontSize: 16,color:Colors.black,
        decoration: todo.isDone? TextDecoration.lineThrough:null,),),
        trailing: Container(
          height:35,
          width:35,
          decoration:BoxDecoration(
            color:Colors.redAccent,
            borderRadius: BorderRadius.circular(5)
          ),
          child:IconButton(
            color:Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              ToDoDelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}