import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/Model/CartModel.dart';
import 'package:food_app/Model/FoodModel.dart';
import 'package:food_app/constants/colors.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  FoodCard(this.food);

  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Food get food => widget.food;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          buildImage(),
          buildTitle(),
          buildRating(),
          buildPriceInfo(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Image(
      image: AssetImage(food.image),
      fit: BoxFit.cover,
      height: 100.0,
      width: 100.0,
    );
  }

  Widget buildTitle() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 16),
      child: Text(
        food.name,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildRating() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 4, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingBar(
            initialRating: food.rate,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 14,
            unratedColor: Colors.black,
            itemPadding: EdgeInsets.only(right: 4.0),
            ignoreGestures: true,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: primaryDarkColor,
            ),
            onRatingUpdate: (rating) {},
          ),
          Text('(${food.rateCount})'),
        ],
      ),
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//          Text(
//            '\$ ${food.price}',
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 16,
//            ),
//          ),
          Card(
            margin: EdgeInsets.only(right: 8),
//            shape: roundedRectangle,
            color: primaryDarkColor,
            child: InkWell(
              onTap: addItemToCard,
              customBorder: roundedRectangle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Order Now"),
              )
            ),
          )
        ],
      ),
    );
  }

  addItemToCard() {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text('Order placed successfully!'),
      duration: Duration(milliseconds: 1000),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    CartModel cartModel = CartModel(food: food, quantity: 1);
    Provider.of<Cart>(context).addItem(cartModel);
  }
}
