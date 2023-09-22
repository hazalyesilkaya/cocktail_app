// ignore_for_file: must_be_immutable, file_names,
import 'package:cocktail_app/Pages/CocktailsPage/CocktailsDetailPage.dart';

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
    list.add(ProductModel(name: "Alcohol3",
        img: "assets/images/valeria.jpg",
        price: "100",
        category: "Liqueur"));

    return list;
  }
}