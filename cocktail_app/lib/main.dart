import 'package:cocktail_app/Pages/StarterPage/StarterPage.dart';
import 'package:flutter/material.dart';


void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const StarterPage(),
    )
);
