import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Helper/DBProvider.dart';
import 'package:food_app/Model/FoodModel.dart';
import 'package:food_app/Screens/LoginScreen.dart';
import 'package:food_app/Widgets/FoodCard.dart';
import 'package:food_app/constants/colors.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int value = 0;
  String username = '';
  DBProvider foodDB = DBProvider();

  @override
  void initState() {
    _fetchUsers();
    super.initState();
  }

  void _fetchUsers() async {
    var users = await foodDB.fetchUsers();
    setState(() {
      username = users[0].email;
    });
  }

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
          actions: [
            IconButton(
              onPressed: (){
                _logout();
              },
              icon: Icon(Icons.exit_to_app, color: Colors.black,),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0),
                width: MediaQuery.of(context).size.width,
                child: Text("Hi, $username",
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
        itemCount: getItemCount(),
        physics: BouncingScrollPhysics(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FoodCard(getType()[index]);
        },
      ),
    );
  }

  getType(){
    if(value == 0){
      return breakFastFoods;
    }else if(value == 1){
      return lunchFoods;
    }else if(value == 2){
     return dinnerFoods;
    }else if(value == 3){
      return snackFoods;
    }else if(value == 4){
      return dessertFoods;
    }
  }
  getItemCount(){
    if(value == 0){
      return breakFastFoods.length;
    }else if(value == 1){
      return lunchFoods.length;
    }
    else if(value == 2){
      return dinnerFoods.length;
    }
    else if(value == 3){
      return snackFoods.length;
    }
    else if(value == 4){
      return dessertFoods.length;
    }
  }


  void _logout() async {

    DBProvider foodDB = new DBProvider();
    await foodDB.deleteUser(1);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );

  }
}


