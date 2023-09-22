// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:cocktail_app/Pages/FirstPage/FirstDetailPage.dart';
import 'package:flutter/material.dart';

class CocktailHorizontalList extends StatelessWidget {
  const CocktailHorizontalList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List myData = [
      "assets/images/valeria.jpg",
      "assets/images/antonio_rose.jpg",
      "assets/images/osvaldo.jpg",
      "assets/images/isabella_mendes.jpg",
    ];
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          // Using ListView.builder

          child: ListView.builder(
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: myData.length,
            // list item builder
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                key: ValueKey(myData[index]),
                margin: const EdgeInsets.all(9),
                width: 140,
                alignment: Alignment.center,
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AspectRatio(
                          aspectRatio: 2.35 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Material(
                              child: Ink.image(
                                image: AssetImage(myData[index]),
                                fit: BoxFit.cover,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FirstDetailPage(Product(
                                            name: 'name',
                                            img: myData[index],
                                            price: 'price',
                                            category: 'category',
                                          )),
                                        ));
                                  },
                                ),
                              ),
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                stops: const [
                                  0.1,
                                  0.9,
                                ],
                                colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.1),
                                ])),
                      ),
                    ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
