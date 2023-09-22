// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api


import 'package:flutter/material.dart';

import '../../Animations/Animation.dart';

class Alcohols extends StatefulWidget{
  const Alcohols ({super.key});

  @override
  State<Alcohols> createState() => AlcoholsState();
}

var isShow = false;
var getdata = Diohelper.getdata();
class AlcoholsState extends State<Alcohols> {
  @override
  Widget build(BuildContext context){
    List <dynamic>widget = [];
    int index = 0;
    for (var element in getdata) {
      element.index = index;
      widget.add(ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(element)));
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
              0.3, Row(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(element.img.toString(),), fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.1),
                        ])),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          element.name.toString(),
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          element.name.toString(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
            ),
          ],
        ),

        trailing: element.isShow
            ? SizedBox(
          width: 90,
          height: 80,
          child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(element.name.toString())));
              },
              child: const Text("Show")),
        )
            : const SizedBox(
          width: 30,
          height: 80,
        ),
      ));
      index++;
    }
    return Scaffold(
      body: Column(
          children:[
            Column(children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Find Your Cocktail',
                style: TextStyle(color: Colors.black87, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 243, 243, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                      hintText: "Search you're looking for",
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            ],),
            Expanded(
              child: GestureDetector(
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [...widget],
                    ).toList(),
                  ),
                ),
              ),
            ),
          ] ),
    );
  }
}

class DetailPage extends StatefulWidget {
  ProductModel model;

  DetailPage(this.model, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.orange.withOpacity(.5),
                  Colors.deepOrange.withOpacity(.7),
                  Colors.white
                ])
            ),),
          ),
          elevation: 0,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(50),
                  children: [
                    Container(
                      width: 200,
                      height: 270,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.red,
                              offset: Offset(10,20),
                              blurRadius: 30,
                            )
                          ],
                          image:  DecorationImage(
                              image: AssetImage("${widget.model.img}"), fit: BoxFit.cover)),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Colors.black.withOpacity(.4),
                              Colors.black.withOpacity(.1),
                            ])),
                      ),
                    ),
                    const SizedBox(
                      height: 30, // <-- SEE HERE
                    ),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Text( "name: ${widget.model.name}",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text( "name: ${widget.model.name}",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30, // <-- SEE HERE
                    ),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Text( "price: ${widget.model.price}",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text( "price: ${widget.model.price}",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30, // <-- SEE HERE
                    ),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Text( "category: ${widget.model.category}",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text( "category: ${widget.model.category}",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}

class ProductModel {
  String? name;
  String? img;
  String? price;
  String? category;
  bool isShow = false;
  int index = 0;

  ProductModel({this.name, this.img, this.price, this.category, this.isShow = false});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    price = json['price'];
    category = json['category'];
    isShow = json['isShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['img'] = img;
    data['price'] = price;
    data['category'] = category;
    data['isShow'] = isShow;
    return data;
  }
}

class Diohelper {
  static List<ProductModel> getdata() {
    List<ProductModel> list = [];
    list.add(ProductModel(name: "Alcohol1",
        img: "assets/images/osvaldo.jpg",
        price: "100",
        category: "Wine"));
    list.add(ProductModel(name: "Alcohol2",
        img: "assets/images/isabella_mendes.jpg",
        price: "100",
        category: "Vodka"));
    list.add(ProductModel(name: "Alcohol3",
        img: "assets/images/martini_drink.jpg",
        price: "100",
        category: "Liqueur"));

    return list;
  }
}