// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:cocktail_app/Pages/CocktailsPage/CocktailsData.dart';
import 'package:cocktail_app/Pages/CocktailsPage/CocktailsDetailPage.dart';
import 'package:cocktail_app/animations/Animation.dart';
import 'package:flutter/material.dart';

class Cocktails extends StatefulWidget {
  const Cocktails({super.key});

  @override
  State<Cocktails> createState() => CocktailsState();
}
var isShow = false;
var getdata = Diohelper.getdata();
class CocktailsState extends State<Cocktails>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List <dynamic>widget = [];
    int index = 0;
    for (var element in getdata) {
      element.index = index;
      widget.add(ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CocktailsDetailPage(element)));
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
                const Text(
                  'Find Your Cocktail',
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                ),
                const SizedBox(
                  height: 4,
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

