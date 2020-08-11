class FoodModel {
  int id;
  String name;
  double price;
  double rate;
  int rateCount;
  String image;
  String foodType;

  FoodModel({this.id, this.name, this.price, this.image, this.rate, this.rateCount, this.foodType});


}

List<String> foodTypes = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Snacks',
  'Dessert',
];

List<FoodModel> foods = [
  FoodModel(
    id: 1,
    name: 'Vegetable Poached Egg',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/plate1.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 2,
    name: 'Avocado Salad With Mayonoise Soy Sauce',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/plate2.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 3,
    name: 'Pancake With Orange Sauce',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/plate5.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 4,
    name: 'Vegetables Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/plate6.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 5,
    name: 'Vegetable Poached Egg',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/plate1.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 6,
    name: 'Avocado Salad With Mayonoise Soy Sauce',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/plate2.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 7,
    name: 'Pancake With Orange Sauce',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/plate5.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 8,
    name: 'Vegetables Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/plate6.png',
    foodType: foodTypes[0],
  ),
];
