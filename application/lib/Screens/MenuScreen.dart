import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Model/FoodModel.dart';
import 'package:food_app/Widgets/FoodCard.dart';
import 'package:food_app/constants/colors.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Menu",
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          leading: Icon(
            Icons.fastfood,
            color: Colors.black,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0),
                width: MediaQuery.of(context).size.width,
                child: Text("Hi, shanindu.rajapaksha91@gmail.com",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),),
              ),
              SizedBox(height: 10.0),
              buildFoodFilter(),
              SizedBox(height: 10.0),
              buildFoodList()
            ],
          ),
        )
    );
  }

  Widget buildFoodFilter() {
    return Container(
      height: 50,
      //color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(foodTypes.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              selectedColor: primaryDarkColor,
              labelStyle: TextStyle(color: value == index ? Colors.white : Colors.black),
              label: Text(foodTypes[index]),
              selected: value == index,
              onSelected: (selected) {
                setState(() {
                  value = selected ? index : null;
                });
              },
            ),
          );
        }),
      ),
    );
  }

  Widget buildFoodList() {
    return Expanded(
      child: GridView.builder(
        itemCount: foods.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FoodCard(foods[index]);
        },
      ),
    );
  }
}
