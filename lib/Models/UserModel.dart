class UserModel{
  static const String ColleciionNAME="Users";
  String? id;
  String? name;
  String?  email;
  String? age;
  List <String>? taskid=[];
  UserModel({
    this.id="",
    required this.name,
    required this.email,
    required this.age,
    required this.taskid,
  });

  UserModel.fromJeson(Map<String,dynamic>json){
    id= json['id'];
    name= json['name'];
    email= json['email'];
    age= json['age'];
    if( json['taskid']!=null ||  json['taskid'].isNotEmpty  )
    json['taskid'].forEach((id){
      taskid?.add(id);
    });
  }

  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'email':email,
      'age':age,
      'taskid':taskid?.map((e) => e.toString()).toList()

    };



  }

}