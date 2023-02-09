import 'package:coffee_app_ui_2/main.dart';
import 'package:flutter/material.dart';


class PlaceOrder extends StatelessWidget {
  // const PlaceOrder({Key? key}) : super(key: key);

  final amount;
  final title;
  final des;
  final price;

  PlaceOrder(this.amount, this.title, this.des, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            SizedBox(height: 150),
            Icon(Icons.check, color: Colors.white, size: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 81, vertical: 21),
              child: Text(
                "Your Order Place \n     Successful",
                style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            Divider(color: Colors.white, thickness: 1.0),
            SizedBox(height: 20),
            ListTile(
              leading: Text(
                amount.toString(),
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              title: Text(
                title.toString(),
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              subtitle: Text(
                des.toString(),
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              trailing: Text(
                "\$${price.toString()}",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              minWidth: 360,
              height: 60,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "Buy Another Drink",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}