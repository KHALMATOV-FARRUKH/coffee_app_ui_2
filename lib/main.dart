import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xff453838),
      primaryColor: Colors.orange,
    ),
  ));
}

class HomeScreen extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Choose Your Drink",
                  style: TextStyle(
                      fontSize: 40,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee1.jpeg", "Americano", "Steam hot foam", "2.5"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee2.jpg", "Cappuccino", "Double Hot milk", "3.5"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee3.jpg", "Flat White", "Steam hot foam", "2.5"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee4.jpg", "Latte", "Double Hot milk", "3.5"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee5.jpg", "Afforgo", "Steam hot foam", "2.5"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee6.jpg", "Hot Chocolate ", "Double Hot milk", "3.5"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee7.jpg", "Flat White", "Steam hot foam", "2.5"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee8.jpg", "Latte", "Double Hot milk", "3.5"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusaContainer extends StatelessWidget {
  // const ReusaContainer({
  //   Key? key,
  // }) : super(key: key);

  final imageUrl;
  final title;
  final desc;
  final price;

  ReusaContainer(this.imageUrl, this.title, this.desc, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        children: [
          Image(
            height: 110,
            fit: BoxFit.fitHeight,
            image: AssetImage(imageUrl),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 22),
          ),
          Text(
            "\$${price}",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}