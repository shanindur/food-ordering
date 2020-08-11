class UserModel{
  final int id;
  final String email;

  UserModel({this.id,this.email});

  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "email" : email,
    };
  }
}