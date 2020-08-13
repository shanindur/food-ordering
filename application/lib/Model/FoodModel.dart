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

List<FoodModel> breakFastFoods = [
  FoodModel(
    id: 1,
    name: 'Chicken Cheese Burger',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/breakfast/burger.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 2,
    name: 'Cereal Fruit Flavour',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/breakfast/cereal.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 3,
    name: 'Fried Rice',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/breakfast/rice.png',
    foodType: foodTypes[0],
  ),
  FoodModel(
    id: 4,
    name: 'Sandwich',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/breakfast/sandwich.png',
    foodType: foodTypes[0],
  )
];


List<FoodModel> lunchFoods = [
  FoodModel(
    id: 1,
    name: 'Vegetable Poached',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/plate1.png',
    foodType: foodTypes[1],
  ),
  FoodModel(
    id: 2,
    name: 'Avocado Salad',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/plate2.png',
    foodType: foodTypes[1],
  ),
  FoodModel(
    id: 3,
    name: 'Pancake With Orange Sauce',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/plate5.png',
    foodType: foodTypes[1],
  ),
  FoodModel(
    id: 4,
    name: 'Vegetables Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/plate6.png',
    foodType: foodTypes[1],
  )
];

List<FoodModel> dinnerFoods = [
  FoodModel(
    id: 1,
    name: 'Biriyani Rice',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/dinner/biriyani.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 2,
    name: 'Soup',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/dinner/soup.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 3,
    name: 'Pasta',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/dinner/pasta.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 4,
    name: 'Vegetable Poached',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/plate1.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 5,
    name: 'Avocado Salad',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/plate2.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 6,
    name: 'Pancake With Orange Sauce',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/plate5.png',
    foodType: foodTypes[2],
  ),
  FoodModel(
    id: 7,
    name: 'Vegetables Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/plate6.png',
    foodType: foodTypes[2],
  )
];

List<FoodModel> snackFoods = [
  FoodModel(
    id: 1,
    name: 'Biscuits',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/snacks/biscuit.png',
    foodType: foodTypes[3],
  ),
  FoodModel(
    id: 2,
    name: 'Nuts',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/snacks/nuts.png',
    foodType: foodTypes[3],
  ),
  FoodModel(
    id: 3,
    name: 'Potato Chips',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/snacks/chips.png',
    foodType: foodTypes[3],
  ),
  FoodModel(
    id: 4,
    name: 'Salsa',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/snacks/salsa.png',
    foodType: foodTypes[3],
  ),
  FoodModel(
    id: 5,
    name: 'Samosa',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/snacks/samosa.png',
    foodType: foodTypes[3],
  )
];

List<FoodModel> dessertFoods = [
  FoodModel(
    id: 1,
    name: 'Apple Pie',
    price: 10,
    rate: 3.0,
    rateCount: 15,
    image: 'assets/images/dessert/applepie.png',
    foodType: foodTypes[4],
  ),
  FoodModel(
    id: 2,
    name: 'Biscuit Pudding',
    price: 20,
    rate: 2,
    rateCount: 25,
    image: 'assets/images/dessert/biscuit_pudding.png',
    foodType: foodTypes[4],
  ),
  FoodModel(
    id: 3,
    name: 'Cheese Cake',
    price: 30,
    rate: 3,
    rateCount: 67,
    image: 'assets/images/dessert/cheese_cake.png',
    foodType: foodTypes[4],
  ),
  FoodModel(
    id: 4,
    name: 'Fruit Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/dessert/fruit_salad.png',
    foodType: foodTypes[4],
  ),
  FoodModel(
    id: 5,
    name: 'Lava Cake',
    price: 40,
    rate: 4,
    rateCount: 29,
    image: 'assets/images/dessert/lava_cake.png',
    foodType: foodTypes[4],
  )
];