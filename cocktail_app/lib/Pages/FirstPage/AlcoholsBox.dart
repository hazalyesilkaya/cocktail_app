// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:cocktail_app/Pages/FirstPage/FirstDetailPage.dart';
import 'package:flutter/material.dart';

class AlcoholsBox extends StatelessWidget {
  const AlcoholsBox( {Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List myData = [
      "assets/images/valeria.jpg",
      "assets/images/antonio_rose.jpg",
      "assets/images/osvaldo.jpg",
      "assets/images/isabella_mendes.jpg",
    ];
    return
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: GridView.builder(
                  itemCount: myData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing:10,mainAxisSpacing: 8),
                  itemBuilder: (context,index){
                    return  AspectRatio(
                        aspectRatio: 0.8 / 1.3,
                        child: ClipRRect(borderRadius: BorderRadius.circular(20),
                          child: Material(
                            child: Ink.image(
                              image: AssetImage(myData[index]),
                              fit: BoxFit.cover,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => FirstDetailPage(
                                          Product(
                                            name: 'name',
                                            img: myData[index],
                                            price: 'price',
                                            category: 'category',
                                          )
                                      ),));
                                },
                              ),
                            ),
                          ),)
                    );
                  }),
            ),
          ],
        ),
      );
  }
}