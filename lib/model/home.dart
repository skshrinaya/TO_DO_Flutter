import 'package:flutter/material.dart';
import 'package:untitled/model/todo.dart';
import 'package:untitled/screens/home_screen.dart';

class Home extends StatelessWidget{
   Home ({Key? key}): super (key: key);

  final todolist=ToDo.todoList();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children:[
                searchBox(),
                Expanded(
                  child: ListView(
                    children:[
                      Container(
                        margin: EdgeInsets.only(top:50,bottom: 20,),
                        child: Text('My TO-DO List',style: TextStyle(
                          fontSize:30,
                          fontWeight:FontWeight.w500,
                        ),),
                      ),

                      for( ToDo todo in todolist)
                        HomeScreen(todo: todo,),



                    ],
                  ),
                ),
              ],
            ),
            ),

         Container(
           margin:EdgeInsets.only(top: 600,left:300,),

           child:ElevatedButton(
             child:Text('+',
               style:TextStyle(
                 fontSize: 40,
               ), ),

             onPressed: () {},


           ),
         ),
        ],
      ),
      );

  }
Widget searchBox(){
    return Container(
          padding:EdgeInsets.symmetric(horizontal: 15),
          decoration:BoxDecoration(
              color:Colors.white70,
              borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,color:Colors.black,size:30,
                ),
                prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25),
                border: InputBorder.none,
                hintText:'Search',
                hintStyle:TextStyle(color: Colors.black54),

              ),
          ),
        );

}
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Row(children:[
        Icon(
          Icons.menu,
          color: Colors.white,
          size:30,
        )
      ])
    );
  }
}