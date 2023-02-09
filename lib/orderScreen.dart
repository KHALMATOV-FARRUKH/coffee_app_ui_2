import 'package:coffee_app_ui_2/main.dart';
import 'package:coffee_app_ui_2/placeOrder.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  // const OrderScreen({Key? key}) : super(key: key);

  final image;
  final title;
  final descr;
  final price;

  OrderScreen(this.image, this.title, this.descr, this.price);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/profile.jpg")),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 21),
              child: Text(
                "How many Do you need?",
                style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                        height: 140,
                        fit: BoxFit.fitHeight,
                        image: AssetImage(widget.image)),
                    SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.descr,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "\$${amount * widget.price}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (amount > 1) {
                        amount--;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff8f6251),
                        borderRadius: BorderRadius.circular(28)),
                    child: Icon(Icons.remove, color: Colors.white, size: 50),
                  ),
                ),
                Text(
                  amount.toString(),
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (amount >= 1) {
                        amount++;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff8f6251),
                        borderRadius: BorderRadius.circular(28)),
                    child: Icon(Icons.add, color: Colors.white, size: 50),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlaceOrder(
                            amount,
                            widget.title,
                            widget.descr,
                            amount * widget.price,
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}