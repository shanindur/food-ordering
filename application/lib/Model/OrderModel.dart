class OrderModel {
  int id;
  int foodId;
  String foodType;
  String foodName;
  String imagePath;
  String createdAt;
  int status;

  OrderModel({this.id, this.foodId, this.foodType, this.foodName, this.imagePath, this.createdAt, this.status});


  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "foodId" : foodId,
      "foodType" : foodType,
      "fooName" : foodName,
      "imagePath" : imagePath,
      "createdAt" : createdAt,
      "status" : status
    };
  }

}

