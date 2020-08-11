import 'package:flutter/material.dart';
import 'FoodModel.dart';

class Cart extends ChangeNotifier {
  List<CartModel> items = [];
  List<CartModel> get cartItems => items;

  void addItem(CartModel cartModel) {
    for (CartModel cart in cartItems) {
      if (cartModel.food.name == cart.food.name) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        notifyListeners();
        return;
      }
    }
    items.add(cartModel);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  void removeItem(CartModel cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartModel cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void removeAllInList(FoodModel food) {
    cartItems.removeWhere((f) {
      return f.food.name == food.name;
    });
    notifyListeners();
  }
}

class CartModel {
  FoodModel food;
  int quantity;

  CartModel({this.food, this.quantity});
}
