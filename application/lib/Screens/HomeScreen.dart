import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Model/FoodModel.dart';
import 'package:food_app/Screens/HistoryScreen.dart';
import 'package:food_app/Screens/MenuScreen.dart';
import 'package:food_app/Widgets/FoodCard.dart';
import 'package:food_app/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int value = 0;
  int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  final List<Widget> _children = [
    MenuScreen(),
    HistoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.restaurant_menu),
            title: new Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('Orders'),
          ),
        ],
      ),
      body: Center(
        child: _children.elementAt(_currentIndex),
      ),
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
