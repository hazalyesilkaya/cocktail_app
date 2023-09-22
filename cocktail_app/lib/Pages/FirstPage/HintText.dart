// ignore_for_file: must_be_immutable, file_names,  library_private_types_in_public_api

import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  const HintText( {Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
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
      ),]);
  }
}