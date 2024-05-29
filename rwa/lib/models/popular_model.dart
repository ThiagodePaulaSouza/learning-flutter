import 'package:flutter/material.dart';

class PopularDietModel {
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calories;
  bool isSelected;

  PopularDietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.level,
      required this.duration,
      required this.calories,
      required this.isSelected});

  static List<PopularDietModel> getAllPopularDiets() {
    List<PopularDietModel> diets = [];

    diets.add(PopularDietModel(
      name: "Bolo",
      iconPath: "assets/images/cake.svg",
      boxColor: Colors.purpleAccent,
      calories: "200g",
      level: "Fácil",
      duration: "4m",
      isSelected: true,
    ));
    diets.add(PopularDietModel(
      name: "Batata frita",
      iconPath: "assets/images/chips.svg",
      boxColor: Colors.limeAccent,
      calories: "600g",
      level: "Dificil",
      duration: "50m",
      isSelected: false,
    ));

    return diets;
  }
}
