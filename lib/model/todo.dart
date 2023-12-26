class ToDo{
  String? id;
  String? text;
  bool isDone;

  ToDo({
    required this.id,
  required this.text,
  this.isDone=false,
});
  static List<ToDo> todoList(){
    return[
      ToDo(id: '1',text:"Do Homeworks",isDone: true),
      ToDo(id: '2',text:"Clean the house", isDone: true),
      ToDo(id:'3',text:"Walk the dog"),
      ToDo(id:'4',text:"Visit the site"),
    ];
  }

}