import 'package:flutter/material.dart';
import 'package:untitled/model/todo.dart';
import 'package:untitled/screens/home_screen.dart';

class Home extends StatefulWidget{
   Home ({Key? key}): super (key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist=ToDo.todoList();
  List<ToDo> found=[];
  final controller=TextEditingController();
  
  @override
  void initState() {
    found=todolist;
    super.initState();
  }

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

                      for( ToDo todo in found.reversed)
                        HomeScreen(todo: todo,
                        ToDoChange: handling,
                        ToDoDelete: delete,),



                    ],
                  ),
                ),
              ],
            ),
            ),
         Align(
           alignment: Alignment.bottomCenter,
           child:Row(children: [
             Expanded(
                 child: Container(
                   margin: EdgeInsets.only(bottom:20,right:20,left:20),
                   decoration: BoxDecoration(
                     color: Colors.white,


                   ),
                   child:TextField(
                     controller: controller,
                     decoration: InputDecoration(
                       hintText: "Add New"
                     ),
                   ),
                 ),)
           ]),
         ),

         Container(
           margin:EdgeInsets.only(top: 600,left:300),

           child:ElevatedButton(
             child:Text('+',
               style:TextStyle(
                 fontSize: 40,
               ), ),

             onPressed: () {
               add(controller.text);
             },


           ),
         ),
        ],
      ),
      );

  }

  void handling(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });

  }
  void delete(String id){
    setState(() {
      todolist.removeWhere((item) => item.id==id);
    });

  }

  void add(String todo){
    setState(() {
      todolist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), text: todo,));
    });
    controller.clear();
  }
  
  void search(String searchItem){
    List<ToDo> result=[];
    if(searchItem.isEmpty){
      result=todolist;
    }
    else{
      result=todolist.where((item) => item.text!.toLowerCase().contains(searchItem.toLowerCase())).toList();
    }
    setState(() {
      found=result;
    });
  }

Widget searchBox(){
    return Container(
          padding:EdgeInsets.symmetric(horizontal: 15),
          decoration:BoxDecoration(
              color:Colors.white70,
              borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            onChanged: (value)=>search(value),
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
       
    );
  }
}