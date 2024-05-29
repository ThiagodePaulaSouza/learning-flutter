import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getAllCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: "Ovo",
        iconPath: "assets/images/egg.svg",
        boxColor: Colors.lightBlueAccent));
    categories.add(CategoryModel(
        name: "Pizza",
        iconPath: "assets/images/sushi.svg",
        boxColor: Colors.lightGreenAccent));
    categories.add(CategoryModel(
        name: "Sushi",
        iconPath: "assets/images/pizza.svg",
        boxColor: Colors.orangeAccent));
    categories.add(CategoryModel(
        name: "Lagosta",
        iconPath: "assets/images/lobster.svg",
        boxColor: Colors.redAccent));

    return categories;
  }
}
