// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:flutter/material.dart';

class FirstDetailPage extends StatefulWidget {
  Product model1;

  FirstDetailPage(this.model1, {Key? key}) : super(key: key);

  @override
  FirstDetailPageState createState() => FirstDetailPageState();
}

class FirstDetailPageState extends State<FirstDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.orange.withOpacity(.5),
                Colors.deepOrange.withOpacity(.7),
                Colors.white
              ])),
            ),
          ),
          elevation: 0,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                          offset: Offset(10, 20),
                          blurRadius: 30,
                        )
                      ],
                      image: DecorationImage(
                          image: AssetImage("${widget.model1.img}"),
                          fit: BoxFit.cover)),
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
                      Text(
                        "name: ${widget.model1.name}",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "name: ${widget.model1.name}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                      Text(
                        "price: ${widget.model1.price}",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "price: ${widget.model1.price}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                      Text(
                        "category: ${widget.model1.category}",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "category: ${widget.model1.category}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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

class Product {
  String? name;
  String? img;
  String? price;
  String? category;

  Product({
    this.name,
    this.img,
    this.price,
    this.category,
  });
}
