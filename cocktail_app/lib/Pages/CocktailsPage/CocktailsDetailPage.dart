// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:flutter/material.dart';

class CocktailsDetailPage extends StatefulWidget {
  ProductModel model;

  CocktailsDetailPage(this.model, {Key? key}) : super(key: key);

  @override
  CocktailsDetailPageState createState() => CocktailsDetailPageState();
}

class CocktailsDetailPageState extends State<CocktailsDetailPage> {
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

