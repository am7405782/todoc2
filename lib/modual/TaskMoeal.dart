class TaskModel{
  String id;
  String title;
   bool  States;
  String Description;
  int date;

  TaskModel({
    this.id="",
    required this.title,
    required this.Description,
    required this.States,
    required this.date,
  });

  TaskModel.fromJeson(Map<String,dynamic>jeson):this(
    id: jeson['id'],
    title: jeson['title'],
    Description:jeson['Description'],
    States: jeson['States'],
    date: jeson['date'],
  );
  Map<String,dynamic> toJeson(){
    return{
      'id':id,
      'title':title,
      'Description':Description,
       'States':States,
      'date':date,
    };
  }




}