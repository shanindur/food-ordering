class MemoModel{
  final int id;
  final String email;

  MemoModel({this.id,this.email});

  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "email" : email,
    };
  }
}