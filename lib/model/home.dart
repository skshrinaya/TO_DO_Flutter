import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home ({Key? key}): super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children:[
            searchBox(),
            ListView(
              children:[
                Container(
                  margin: EdgeInsets.only(top:50,bottom: 20,),
                  child: Text('All TO-DO',style: TextStyle(
                   56 fontSize:30,
                    fontWeight:FontWeight.w500,
                  ),),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
Widget searchBox(){
    return Container(
          padding:EdgeInsets.symmetric(horizontal: 15),
          decoration:BoxDecoration(
              color:Colors.white,
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

              )
          ),
        )
    )
}
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black54,
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