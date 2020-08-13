import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Helper/DBProvider.dart';
import 'package:food_app/Model/OrderModel.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DBProvider foodDB = DBProvider();
  List<OrderModel> allOrders;
  List<OrderModel> filteredOrders;
  int ordersLength = 0;
  bool isFetchData = false;
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context,bool isFirst) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedFromDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedFromDate) {
      setState(() {
        if(isFirst){
          selectedFromDate = picked;
        }else{
          selectedToDate = picked;
        }

      });
    }
  }

  @override
  void initState() {
    fetchOrders();
    super.initState();
  }

  onItemChanged() {
    _selectDate(context, true);
    setState(() {
      filteredOrders = allOrders.where((element) => element.foodType.contains("Breakfast"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Orders",
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          leading: Icon(
            Icons.list,
            color: Colors.black,
          ),
        ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Container(
//                  width: 160.0,
//                  height: 70.0,
//                  padding: EdgeInsets.all(8.0),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(5.0),
//                    color: Colors.white,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.grey,
//                        offset: Offset(0.0, 1.0), //(x,y)
//                        blurRadius: 6.0,
//                      ),
//                    ],
//                  ),
//                  child: InkWell(
//                    onTap: () => onItemChanged(),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Row(
//                          children: [
//                            Icon(Icons.date_range),
//                            SizedBox(width: 10.0,),
//                            Text("Date From",
//                            style: TextStyle(
//                              fontSize: 16.0,
//                              fontWeight: FontWeight.bold
//                            ),)
//                          ],
//                        ),
//                        Align(
//                          alignment: Alignment.topLeft,
//                          child: Text("${selectedFromDate.toLocal()}".split(' ')[0],
//                          textAlign: TextAlign.left,
//                          style: TextStyle(
//                            fontSize: 18.0,
//                            color: Colors.grey
//                          ),),
//                        ),
//                      ],
//                    )
//
//                  ),
//                ),
//                Container(
//                  width: 160.0,
//                  height: 70.0,
//                  padding: EdgeInsets.all(8.0),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(5.0),
//                    color: Colors.white,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.grey,
//                        offset: Offset(0.0, 1.0), //(x,y)
//                        blurRadius: 6.0,
//                      ),
//                    ],
//                  ),
//                  child: InkWell(
//                      onTap: () => _selectDate(context, false),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Row(
//                            children: [
//                              Icon(Icons.date_range),
//                              SizedBox(width: 10.0,),
//                              Text("Date To",
//                                style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.bold
//                                ),)
//                            ],
//                          ),
//                          Align(
//                            alignment: Alignment.topLeft,
//                            child: Text("${selectedToDate.toLocal()}".split(' ')[0],
//                              textAlign: TextAlign.left,
//                              style: TextStyle(
//                                  fontSize: 18.0,
//                                  color: Colors.grey
//                              ),),
//                          ),
//                        ],
//                      )
//
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(height: 20.0,),
            Container(
              height: MediaQuery.of(context).size.height - 250.0,
              child: ordersLength > 0
                  ?
                  ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: ordersLength,
                        itemBuilder: (BuildContext context,int index){
                          return _buildRow(filteredOrders[index]);
                        } ,

                  )
                  :
                  Center(child: CircularProgressIndicator())
            )
          ],
        ),
      )
    );
  }
  Widget _buildRow(OrderModel order){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: (){
//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (context) => DetailPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(order.imagePath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0,
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.foodName,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              order.foodType + " | " + order.createdAt,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
             Icon(order.status == 0 ? Icons.remove_circle : Icons.check_circle,
               color: order.status == 0 ? Colors.red : Colors.green,),
          ],

        ),
      ),
    );
  }
  void fetchOrders() async {
    var orders = await foodDB.fetchOrders();
    setState(() {
      allOrders = orders;
      filteredOrders = orders;
      ordersLength = allOrders.length;
    });
  }

}




