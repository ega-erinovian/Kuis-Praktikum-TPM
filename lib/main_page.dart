import 'package:flutter/material.dart';
import 'about_page.dart';
import 'detail_page.dart';
import 'login_page.dart';

import 'menu.dart';

class MainPage extends StatefulWidget{
  final String username;
  const MainPage({Key? key, required this.username}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Utama"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.description), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutPage(username: widget.username);
            }));
          },),
          IconButton(icon: const Icon(Icons.logout), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),

    );
  }

  Widget _createListCard() {
    var dataMenu = getAllMenu();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(Menu data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(name: data.name, image: data.image,  desc: data.desc, price: data.price, category: data.category, ratings: data.ratings, reviewer: data.reviewer, sold: data.sold);
          }));
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(data.image),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(
                    "${data.name} - Rp${data.price}", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 15),)),
            ),
          ],
        ),
      ),
    );
  }
}