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
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderScreen(
                                      "images/coffee1.jpeg",
                                      "Americano",
                                      "Steam hot foam",
                                      2.5)));
                        },
                        child: ReusaContainer("images/coffee1.jpeg",
                            "Americano", "Steam hot foam", "1")),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee2.jpg", "Cappuccino",
                        "Double Hot milk", "4"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee3.jpg", "Flat White",
                        "Steam hot foam", "2.5"),
                  ),
                  Expanded(
                    child: ReusaContainer(
                        "images/coffee4.jpg", "Latte", "Double Hot milk", "3"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer(
                        "images/coffee5.jpg", "Afforgo", "Steam hot foam", "2"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee6.jpg",
                        "Hot Chocolate ", "Double Hot milk", "3.5"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusaContainer("images/coffee7.jpg", "Espresso",
                        "Steam hot foam", "1.5"),
                  ),
                  Expanded(
                    child: ReusaContainer("images/coffee8.jpg", "Iced Mocha",
                        "Double Hot milk", "3"),
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
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 22),
          ),
          Text(
            "\$${price}",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

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
                      "\$${widget.price}",
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
                  onTap: (){
                    setState(() {
                      amount--;
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
                Text(amount.toString(), style: TextStyle(fontSize: 60, color: Colors.white),),
                InkWell(
                  onTap: (){
                    setState(() {
                      amount++;
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
          ],
        ),
      ),
    );
  }
}
