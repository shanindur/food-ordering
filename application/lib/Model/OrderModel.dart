class OrderModel {
  int id;
  int foodId;
  String foodType;
  String createdAt;
  int status;

  OrderModel({this.id, this.foodId, this.foodType, this.createdAt, this.status});


  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "foodId" : foodId,
      "foodType" : foodType,
      "createdAt" : createdAt,
      "status" : status
    };
  }

}

