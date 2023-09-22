// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../Animations/Animation.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
                1,
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search Event",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            FadeAnimation(
                1.2,
                makeItem(
                    icon: Icons.image, name: "First"),),
            const SizedBox(
              height: 20,
            ),
            FadeAnimation(
                1.3,
                makeItem(
                    icon: Icons.account_circle,
                    name: "Second")),
            const SizedBox(
              height: 20,
            ),
            FadeAnimation(1.3,
                makeItem(icon: Icons.mail, name: "Third")),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget makeItem({icon, name}) {
    return SingleChildScrollView(
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 90,
            width: 370,
            child: Column(
              children: [
                SizedBox(
                  width: 140,
                  height: 60,
                  child: Icon(icon, size: 45, color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 140,
                    height: 140,
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            name,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

      ),
    );
  }
}
