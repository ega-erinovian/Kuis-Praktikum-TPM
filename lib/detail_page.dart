import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String desc;
  final int price;
  final String category;
  final double ratings;
  final int reviewer;
  final int sold;

  const DetailPage({
    Key? key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.category,
    required this.ratings,
    required this.reviewer,
    required this.sold,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _sold = sold;

    void _incrementCounter() {
        _sold++;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Image.network(image, width: 500,),
              //SizedBox(height: 16,),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 16,),
              Text("Description : ${desc}", textAlign: TextAlign.justify,),
              SizedBox(height: 16,),
              Text(" "),
              Text("Price : Rp.${price}"),
              Text(" "),
              Text("Ratings : ${ratings}"),
              Text(" "),
              Text("Reviewer : ${reviewer}"),
              Text(" "),
              Text("Sold : $_sold"),
              SizedBox(height: 100,),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
